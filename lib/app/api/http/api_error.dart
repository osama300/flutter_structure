import 'dart:convert';

ApiError apiErrorFromJson(jsonBody) => ApiError.fromJson(jsonBody);
String apiErrorToJson(ApiError data) => json.encode(data.toJson());

class ApiError {
  int status;
  String msg;
  DateTime serverTime;
  List<dynamic> data;

  ApiError({
    required this.status,
    required this.msg,
    required this.serverTime,
    required this.data,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
    status: json["status"],
    msg: json["msg"],
    serverTime: DateTime.parse(json["server_time"]),
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "server_time": serverTime.toIso8601String(),
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
