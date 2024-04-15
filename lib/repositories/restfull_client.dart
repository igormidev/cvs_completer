// ignore: lines_longer_than_80_chars
// ignore_for_file: inference_failure_on_function_invocation, avoid_catches_without_on_clauses

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

final restfullBaseClient = Provider<IRestfullClient>((ref) {
  const baseUrl = 'https://api.dsfootball.io/v2';
  final client = RestfullClient(
    baseUrl: baseUrl,
  );
  return client;
});

final restfullWyScoutClient = Provider<IRestfullClient>((ref) {
  const baseUrl = 'https://apirest.wyscout.com/v3';
  final client = RestfullClient(
    baseUrl: baseUrl,
  );
  const username = 'zrh45l6-l378ebenf-yk0hfao-ku74zxyc47';
  const password = '(g#za4H&oaY=JJIQ%mX:e2T^M,YMhq';
  final basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  client.addAnDefaultHeader('Authorization', basicAuth);
  return client;
});

abstract class IRestfullClient {
  void addAnDefaultHeader(
    String key,
    String value,
  );

  void removeDefaultHeader(String key);

  Future<Either<String, T>> get<T>({
    required String path,
    required FromMapFunction<T> fromMapFunction,
    Map<String, String>? queryParameters,
    Map<String, String>? aditionalHeaders,
  });

  Future<Either<String, List<T>>> getList<T>({
    required String path,
    required FromMapFunction<T> fromMapFunction,
    Map<String, String>? queryParameters,
    Map<String, String>? aditionalHeaders,
  });

  Future<Either<String, T>> post<T>({
    required String path,
    required FromMapFunction<T> fromMapFunction,
    required dynamic body,
    Map<String, String>? queryParameters,
    Map<String, String>? aditionalHeaders,
  });
}

/// The function will be used to convert a map to a desired object
typedef FromMapFunction<T> = FutureOr<T> Function(Map map);
typedef FromDynamicFunction<T> = FutureOr<T> Function(dynamic map);

class RestfullClient implements IRestfullClient {
  RestfullClient({
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  final String _baseUrl;
  final Dio _dio = Dio()
    ..interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ),
      ),
    );

  final Map<String, String> _defaultHeaders = {};

  /// Will add a default header that will be used in every rest call
  @override
  void addAnDefaultHeader(
    String key,
    String value,
  ) {
    _defaultHeaders.addAll({key: value});
  }

  @override
  void removeDefaultHeader(String key) {
    _defaultHeaders.remove(key);
  }

  @override
  Future<Either<String, T>> get<T>({
    required String path,
    Map<String, String>? queryParameters,
    required FromMapFunction<T> fromMapFunction,
    Map<String, String>? aditionalHeaders,
  }) async {
    return _httpErrorHandlerWrapper(
      () => _dio.get(
        _baseUrl + path,
        queryParameters: queryParameters,
        options: Options(
          headers: {..._defaultHeaders, ...?aditionalHeaders},
        ),
      ),
      (map) {
        return fromMapFunction(map);
      },
    );
  }

  @override
  Future<Either<String, List<T>>> getList<T>({
    required String path,
    Map<String, String>? queryParameters,
    required FromMapFunction<T> fromMapFunction,
    Map<String, String>? aditionalHeaders,
  }) async {
    return _httpErrorHandlerWrapper(
      () => _dio.get(
        _baseUrl + path,
        queryParameters: queryParameters,
        options: Options(
          headers: {..._defaultHeaders, ...?aditionalHeaders},
        ),
      ),
      (data) async {
        // ignore: avoid_dynamic_calls
        final dataAsMap = data as List<dynamic>;
        final castedMap = dataAsMap.cast<Map<String, dynamic>>();
        final List<T> items = [];
        for (final json in castedMap) {
          items.add(await fromMapFunction(json));
        }
        return items;
      },
    );
  }

  @override
  Future<Either<String, T>> post<T>({
    required String path,
    Map<String, String>? queryParameters,
    required FromMapFunction<T> fromMapFunction,
    required dynamic body,
    Map<String, String>? aditionalHeaders,
  }) async {
    return _httpErrorHandlerWrapper(
      () => _dio.post(
        _baseUrl + path,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {..._defaultHeaders, ...?aditionalHeaders},
        ),
      ),
      (map) {
        return fromMapFunction(map as Map<String, String>);
      },
    );
  }

  Future<Either<String, T>> _httpErrorHandlerWrapper<T>(
    Future<Response<dynamic>> Function() function,
    FromDynamicFunction<T> fromMapFunction,
  ) async {
    try {
      final result = await function();
      try {
        final fromMap = await fromMapFunction(result.data);
        return Right(fromMap);
      } catch (error, stackTrace) {
        log(error.toString(), stackTrace: stackTrace);
        return Left(error.toString());
      }
    } on DioException catch (error, stackTrace) {
      if (kDebugMode) {
        log(error.toString(), stackTrace: stackTrace);
      }
      return Left(_defaultErrorHandler(error));
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Left(error.toString());
    }
  }

  String _defaultErrorHandler(DioException error) {
    if (error.response != null) {
      return 'Error: ${error.response!.statusCode} - ${error.message}';
    } else {
      return 'Error: ${error.message}';
    }
  }
}
