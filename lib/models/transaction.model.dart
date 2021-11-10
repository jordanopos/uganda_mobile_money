import 'dart:convert';

TransactionResponseModel transactionResponseModelFromJson(String str) =>
    TransactionResponseModel.fromJson(json.decode(str));

String transactionResponseModelToJson(TransactionResponseModel data) =>
    json.encode(data.toJson());

class TransactionResponseModel {
  TransactionResponseModel({
    required this.status,
    required this.message,
    required this.meta,
    required this.data,
  });

  String status;
  String message;
  Meta meta;
  List<Datum> data;

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      TransactionResponseModel(
        status: json["status"],
        message: json["message"],
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.txRef,
    required this.flwRef,
    required this.deviceFingerprint,
    required this.amount,
    required this.currency,
    required this.chargedAmount,
    required this.appFee,
    required this.merchantFee,
    required this.processorResponse,
    required this.authModel,
    required this.ip,
    required this.narration,
    required this.status,
    required this.paymentType,
    required this.createdAt,
    required this.amountSettled,
    required this.customer,
    required this.accountId,
    required this.meta,
  });

  int id;
  String txRef;
  String flwRef;
  String deviceFingerprint;
  int amount;
  String currency;
  int chargedAmount;
  int appFee;
  int merchantFee;
  String processorResponse;
  String authModel;
  String ip;
  String narration;
  String status;
  String paymentType;
  DateTime createdAt;
  dynamic amountSettled;
  Customer customer;
  int accountId;
  dynamic meta;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        txRef: json["tx_ref"],
        flwRef: json["flw_ref"],
        deviceFingerprint: json["device_fingerprint"],
        amount: json["amount"],
        currency: json["currency"],
        chargedAmount: json["charged_amount"],
        appFee: json["app_fee"],
        merchantFee: json["merchant_fee"],
        processorResponse: json["processor_response"],
        authModel: json["auth_model"],
        ip: json["ip"],
        narration: json["narration"],
        status: json["status"],
        paymentType: json["payment_type"],
        createdAt: DateTime.parse(json["created_at"]),
        amountSettled: json["amount_settled"],
        customer: Customer.fromJson(json["customer"]),
        accountId: json["account_id"],
        meta: json["meta"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tx_ref": txRef,
        "flw_ref": flwRef,
        "device_fingerprint": deviceFingerprint,
        "amount": amount,
        "currency": currency,
        "charged_amount": chargedAmount,
        "app_fee": appFee,
        "merchant_fee": merchantFee,
        "processor_response": processorResponse,
        "auth_model": authModel,
        "ip": ip,
        "narration": narration,
        "status": status,
        "payment_type": paymentType,
        "created_at": createdAt.toIso8601String(),
        "amount_settled": amountSettled,
        "customer": customer.toJson(),
        "account_id": accountId,
        "meta": meta,
      };
}

class Customer {
  Customer({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.createdAt,
  });

  int id;
  String email;
  String phoneNumber;
  String name;
  DateTime createdAt;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone_number": phoneNumber,
        "name": name,
        "created_at": createdAt.toIso8601String(),
      };
}

class Meta {
  Meta({
    required this.pageInfo,
  });

  PageInfo pageInfo;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pageInfo: PageInfo.fromJson(json["page_info"]),
      );

  Map<String, dynamic> toJson() => {
        "page_info": pageInfo.toJson(),
      };
}

class PageInfo {
  PageInfo({
    required this.total,
    required this.currentPage,
    required this.totalPages,
  });

  int total;
  int currentPage;
  int totalPages;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        total: json["total"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "current_page": currentPage,
        "total_pages": totalPages,
      };
}
