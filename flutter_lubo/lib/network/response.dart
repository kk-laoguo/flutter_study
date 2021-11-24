import 'dart:convert';

import 'package:flutter_lubo/network/app_exception.dart';

class Result<T> {
  RequestStatus statusCode;
  T? data;
  AppException? exception;
  Result.completed(this.data) : statusCode = RequestStatus.success;
  Result.error(this.exception) : statusCode = RequestStatus.error;

  @override
  String toString() {
    return "statusCode : ${statusCode} \n message : $exception \n Data : $data";
  }
}

enum RequestStatus { success, error }

class RequestResponse<T> {
  RequestResponse({
    this.data,
    this.statusCode,
  });

  T? data;
  String? statusCode;

  bool get isSuccess {
    return statusCode == "0";
  }

  factory RequestResponse.fromJson(Map<String, dynamic> json) =>
      RequestResponse(
        data: json["data"],
        statusCode: json["retCode"],
      );
  Map<String, dynamic> toJson() => {
        "data": json.encode(data),
        "retCode": statusCode,
      };
}
