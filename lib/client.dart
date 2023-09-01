import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../models/pay.request.dart';
import '../models/pay.response.dart';
import '../models/transaction.model.dart';

class UgandaMobileMoney {
  /// The secret key got from your flutterwave dashboard. go to https://dashboard.flutterwave.com/dashboard/settings/apis
  String secretKey;
  Logger _logger = Logger();
  Dio _dio = Dio();

  UgandaMobileMoney({
    required this.secretKey,
  });

  /// Initialtes a payment through the flutterwave api, works on both MTN and AIRTEL
  Future<MomoPayResponse> chargeClient(MomoPayRequest request) async {
    try {
      String requestUrl =
          "https://api.flutterwave.com/v3/charges?type=mobile_money_uganda";

      var headers = {'Authorization': 'Bearer $secretKey'};

      var response = await _dio.post(requestUrl,
          options: Options(headers: headers),
          data: json.encode(request.toJson()));

      _logger.i(response.data);

      Map<String, dynamic> gottenResponse = response.data;

      MomoPayResponse momoPayResponse =
          MomoPayResponse.fromJson(gottenResponse);

      return momoPayResponse;
    } catch (e) {
      _logger.e(e.toString());
      return MomoPayResponse(status: "Failed", message: "Something Went wrong");
    }
  }

  /// Before adding value to a transaction, you should always verify it first. This will return a {TransactionStatus} that can be either failed, pending , success or unknown
  Future<TransactionStatus> verifyTransaction(txRef) async {
    Datum? currentTransaction;

    try {
      String verifyTXNURL =
          'https://api.flutterwave.com/v3/transactions?tx_ref=$txRef';

      var response = await _dio.get(
        verifyTXNURL,
        options: Options(headers: {'Authorization': 'Bearer $secretKey'}),
      );

      var jsonData = jsonDecode(response.data);

      TransactionResponseModel model =
          TransactionResponseModel.fromJson(jsonData);

      if (model.data.length == 1) {
        Datum? currentTxn = model.data[0];
        currentTransaction = currentTxn;
      }

      if (currentTransaction != null) {
        return getTransactionStatus(currentTransaction);
      } else {
        return TransactionStatus.unknown;
      }
    } catch (e) {
      _logger.e(e.toString());

      return TransactionStatus.unknown;
    }
  }
}

enum TransactionStatus { success, pending, failed, unknown }

TransactionStatus getTransactionStatus(Datum transaction) {
  switch (transaction.status) {
    case "success":
      return TransactionStatus.success;

    case "failed":
      return TransactionStatus.failed;
    case "pending":
      return TransactionStatus.pending;
    default:
      return TransactionStatus.unknown;
  }
}
