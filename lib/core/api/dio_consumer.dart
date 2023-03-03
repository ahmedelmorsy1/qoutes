// if you want to use http just make http_consumer.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:qoutes/barell_file.dart';
import 'package:qoutes/injection_container.dart' as di;


class DioConsumer implements ApiConsumer{
  final Dio client;

  DioConsumer({required this.client}){
    //to avoid dio error
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
    ..baseUrl = EndPoints.baseUrl
    ..responseType =ResponseType.plain
    ..followRedirects = false
    ..validateStatus = (status){
      return status! < StatusCode.internalServerError ;
    };
    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode){
    client.interceptors.add(di.sl<LogInterceptor>());//بدل ال prints
  }}
  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try{
    final response = await client.get(path,queryParameters: queryParameters);
    // return _jsonResponse(response);
     _jsonResponse(response);
        }on DioError catch (error){
    _handleDioError(error);
    }
  }

  @override
  Future post(String path, {Map<String, dynamic>? body,bool formDataIsEnabled =false,
   Map<String, dynamic>? queryParameters}) async {
    try { final response =
     await client.post(path,queryParameters: queryParameters,
     data:formDataIsEnabled? FormData.fromMap(body!):body);
    _jsonResponse(response);
    }on DioError catch (error){
    _handleDioError(error);
    }
  }

  @override
  Future put(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    try{
      final response = await client.put(path,queryParameters: queryParameters,data:body);
    _jsonResponse(response);
       }on DioError catch (error){
    _handleDioError(error);
    }
  }

  _jsonResponse(Response<dynamic> response) {
    return jsonDecode(response.data.toString());
  }
  dynamic _handleDioError(DioError error){
    switch(error.type){
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
         throw const FetchDataException();
      case DioErrorType.response:
         switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unAuthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}