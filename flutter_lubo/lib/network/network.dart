import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_lubo/network/error.dart';
import 'package:flutter_lubo/utils/local_cache.dart';

class Network {
  static late final Dio dio;
  static final Network _instance = Network._internal();
  factory Network() => _instance;

  final CancelToken _cancelToken = CancelToken();

  Network._internal() {
    BaseOptions options = BaseOptions();
    dio = Dio(options);
    dio.interceptors.add(ErrorInterceptor());
  }

  void init({
    String? baseURL,
    int? connectTimeout,
    int? receiveTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    dio.options = dio.options.copyWith(
        baseUrl: baseURL,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: headers ?? {});
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  // close
  void cancelRequest({required CancelToken token}) {
    _cancelToken.cancel("canceled");
  }

  Map<String, dynamic>? _getAuthorizationHeader() {
    Map<String, dynamic>? headers;
    String? accessToken = LocalCache().getLocalString("accessToken");
    if (accessToken != null) {
      headers = {
        'Authorization': 'Bearer $accessToken',
      };
    }
    return headers;
  }

  Options _getRequestOptions(Options? options) {
    Options reqOptions = options ?? Options();
    Map<String, dynamic>? _authorization = _getAuthorizationHeader();
    if (_authorization != null) {
      reqOptions = reqOptions.copyWith(headers: _authorization);
    }
    return reqOptions;
  }

  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
  }) async {
    Options reQoptions = _getRequestOptions(options);
    return await dio.get(path,
        queryParameters: params,
        options: reQoptions,
        cancelToken: cancelToken,
        onReceiveProgress: progressCallback);
  }

  Future post(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Options requestOptions = _getRequestOptions(options);
    return await dio.post(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Options requestOptions = _getRequestOptions(options);
    return await dio.put(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Options requestOptions = _getRequestOptions(options);
    return await dio.patch(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = _getRequestOptions(options);
    return await dio.delete(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
  }
}
