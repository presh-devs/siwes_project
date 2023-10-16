import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl = baseURL;
    _log.i('Api constructed and DIO setup register');
  }
  String baseURL = 'https://siwes-project-bea592041b39.herokuapp.com/';
  String createUser = 'users';
  String loginUser = 'users/auth';
  String createBussiness = 'businesses';
  String createBussinessReview = 'businesses';
  String getAllReviews(String busId) => 'businesses/$busId/reviews';
  String getBussinessReview({required String busId, required String reviewId}) => 'businesses/$busId/$reviewId';
  String allBussinesses = 'businesses';
  String getBussiness(String busId) => 'businesses/$busId';

  static final _log = Logger();

  Future<AppHttpResponse> post(
      {required String path,
      required Map<String, dynamic> data,
      String key = 'data'}) async {
        final endpoint = '$baseURL$path';
    try {
      _log.i(
          'Making Post Request to $endpoint with the following data \n$data');
      Response response = await _dio.post(endpoint, data: data);
      return AppHttpResponse(false, response.data[key], '');
    } on DioException catch (e) {
      _log.e('Error from $endpoint', error: e);
      return handleError(e);
    }
  }

  Future<AppHttpResponse> uploadImage(String url, File file) async {
    try {
      Uint8List bytes = await file.readAsBytes();

      var response = await http.put(Uri.parse(url), body: bytes);

      return AppHttpResponse(false, response.statusCode, '');
    } on DioException catch (e) {
      return handleError(e);
    }
  }

  Future<AppHttpResponse> get(
      {required String path,
      required Map<String, dynamic> params,
      String key = 'data'}) async {
         final endpoint = '$baseURL$path';
    try {
      _log.i('Making Get Request to $endpoint with the following data \n$params');
      Response response = await _dio.get(endpoint, queryParameters: params);
      return AppHttpResponse(false, response.data[key], '');
    } on DioException catch (e) {
      _log.e('Error from $endpoint', error: e);
      return handleError(e);
    }
  }

  Future<AppHttpResponse> patch(String path, Map<String, dynamic> data) async {
     final endpoint = '$baseURL$path';
    try {
       
      _log.i('Making Patch Request to $endpoint with the following data \n$data');
      Response response = await _dio.patch(endpoint, data: data);
      AppHttpResponse res = AppHttpResponse(false, response.data['data'], '');
      return res;
    } on DioException catch (e) {
      _log.e('Error from $endpoint', error: e);
      return handleError(e);
    }
  }

  Future<AppHttpResponse> delete(String path, Map<String, dynamic> data) async {
     final endpoint = '$baseURL$path';
    try {
      _log.i('Making Delete Request to $endpoint with the following data \n$data');
      Response response = await _dio.delete(endpoint, data: data);
      AppHttpResponse res = AppHttpResponse(false, response.data['data'], '');
      return res;
    } on DioException catch (e) {
      _log.e('Error from $endpoint', error: e);
      return handleError(e);
    }
  }

  AppHttpResponse handleError(DioException e) {
    if (e.response != null) {
      dynamic data = e.response?.data;
      if (data != null && data is Map && data.isNotEmpty) {
        Map<String, dynamic> d = Map.from(data);
        return AppHttpResponse(true, e.response?.data, d['message']);
      } else {
        return AppHttpResponse(
          true,
          e.response?.data,
          e.message ?? '',
        );
      }
    } else {
      return AppHttpResponse(true, e.error, e.message ?? '');
    }
  }
}

class AppHttpResponse<T> {
  bool error;
  String message;
  T data;
  AppHttpResponse(this.error, this.data, this.message);
}

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(Dio());
});
