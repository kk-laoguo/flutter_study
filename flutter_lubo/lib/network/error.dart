import 'dart:io';

import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lubo/network/app_exception.dart';

class ErrorInterceptor extends Interceptor {
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.error is SocketException) {
      err.error = DioSocketException(
        err.message,
        osError: err.error?.osError,
        address: err.error?.address,
        port: err.error?.port,
      );
    }
    if (err.type == DioErrorType.other) {
      bool isConnectNetWork = await isConnected();
      if (!isConnectNetWork && err.error is DioSocketException) {
        err.error.message = "当前网络不可用，请检查您的网络";
      }
    }
    // error统一处理
    AppException appException = AppException.create(err);
    // 错误提示
    debugPrint('DioError===: ${appException.toString()}');
    err.error = appException;
    super.onError(err, handler);
  }
}

class DioSocketException extends SocketException {
  late String msg;
  DioSocketException(msg, {osError, address, port})
      : super(msg, osError: osError, address: address, port: port);

}
