import 'dart:convert';

MomoPayResponse momoPayResponseFromJson(String str) =>
    MomoPayResponse.fromJson(json.decode(str));

String momoPayResponseToJson(MomoPayResponse data) =>
    json.encode(data.toJson());

class MomoPayResponse {
  MomoPayResponse({
    required this.status,
    required this.message,
     this.data,
  });

  /// This is the staus of the transaction you have just made. Can be "success" or "failed"
  String status;
  /// This is the message that flutterwave returns when you iniate a paymnet request
  String message;
  /// The data returned from the request. can be null if something happened internally when making the request. Eg the client has poor network etc
  Data? data;

  factory MomoPayResponse.fromJson(Map<String, dynamic> json) =>
      MomoPayResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    required this.authorization,
  });
   /// the data returned back from the request as an object
  Authorization authorization;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authorization: Authorization.fromJson(json["authorization"]),
      );

  Map<String, dynamic> toJson() => {
        "authorization": authorization.toJson(),
      };
}

class Authorization {
  Authorization({
    required this.redirect,
    required this.mode,
  });
  /// Use this link to redirect your users to a page where they will complete the OTP verification to a page where they can verift the flutterwave OTP and then get prompts on their phone to pay the money requested
  String redirect;

  String mode;

  factory Authorization.fromJson(Map<String, dynamic> json) => Authorization(
        redirect: json["redirect"],
        mode: json["mode"],
      );

  Map<String, dynamic> toJson() => {
        "redirect": redirect,
        "mode": mode,
      };
}
