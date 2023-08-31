class MomoPayResponse {
  final String status;
  final String message;
  Metax? meta;

  MomoPayResponse({
    required this.status,
    required this.message,
    this.meta,
  });

  factory MomoPayResponse.fromJson(Map<String, dynamic> json) {
    return MomoPayResponse(
      status: json["status"],
      message: json["message"],
      meta: Metax.fromJson(json["meta"]),
    );
  }
}

class Metax {
  final Authorization authorization;

  Metax({
    required this.authorization,
  });

  factory Metax.fromJson(Map<String, dynamic> json) {
    return Metax(
      authorization: Authorization.fromJson(json["authorization"]),
    );
  }
}

class Authorization {
  final String redirect;
  final String mode;

  Authorization({
    required this.redirect,
    required this.mode,
  });

  factory Authorization.fromJson(Map<String, dynamic> json) {
    return Authorization(
      redirect: json["redirect"],
      mode: json["mode"],
    );
  }
}
