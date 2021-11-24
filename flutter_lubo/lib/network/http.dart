import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_lubo/network/network.dart';
import 'package:flutter_lubo/network/response.dart';

class Http {
  static void init({
    required String baseURL,
    int connectTimeOut = 5000,
    int receiveTimeOut = 5000,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    Network().init(
      baseURL: baseURL,
      connectTimeout: connectTimeOut,
      receiveTimeout: receiveTimeOut,
      headers: headers,
      interceptors: interceptors,
    );
  }

  static void cancelRequests({required CancelToken token}) {
    Network().cancelRequest(token: token);
  }

  static RequestResponse _getMap(dynamic jsonString) {
    return RequestResponse.fromJson(json.decode(jsonString));
  }

  static Future<RequestResponse> get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
  }) async {
    Response response = await Network().get(path,
        params: params,
        options: options,
        cancelToken: cancelToken,
        progressCallback: progressCallback);
    debugPrint("path===" + response.data);
    return _getMap(response.data);
  }

  static Future<RequestResponse> post(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
  }) async {
    Response response = await Network().post(path,
        params: params,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: progressCallback);
    return _getMap(response.data);
  }
}
