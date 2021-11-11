import 'package:logger/logger.dart';

enum UgandaNetwork { mtn, airtel }

class MomoPayRequest {
  MomoPayRequest({
    required this.txRef,
    required this.amount,
    required this.email,
    required this.phoneNumber,
    required this.fullname,
    required this.redirectUrl,
    required this.voucher,
    required this.network,
  });

  ///The transaction reference for a particular transaction, make sure each transaction ref is different from another.
  String txRef;

  /// The amount you want to charge as a String. The request will fail if the person has insuffecient funds
  String amount;

  /// The email of the person you are charging
  String email;

  /// The phone number of the person you are charging. Make sure they are registerd on mobile money.
  String phoneNumber;

  /// The full name of the person you are charging
  String fullname;

  /// When the person has sucessfully filled in the OTP. Flutterwave will redirect them to this url. It can be a verification url for your service. Flutterwave automatically supplies the query params
  String redirectUrl;

  /// this can be ignored because it is mainly used in Vodafone
  String voucher;

  /// the network you are charging, which is a {{UgandaNetwork}}. This can be either MTN or AIRTEL
  UgandaNetwork network;

  Map<String, dynamic> toJson() => {
        "tx_ref": txRef,
        "amount": amount,
        "email": email,
        "phone_number": phoneNumber,
        "currency": "UGX",
        "fullname": fullname,
        "redirect_url": redirectUrl,
        "voucher": voucher,
        "network": network.turnToString(),
      };
}

extension NetworkExtension on UgandaNetwork {
  String turnToString() {
    String networkString = this.toString().substring(14).toUpperCase();
    return networkString;
  }
}
