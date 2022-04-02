// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class VDoctorApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //Base URL
    _dio.options.baseUrl = "https://vdoctor.herokuapp.com/";
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = 60 * 3000;
    _dio.options.receiveTimeout = 60 * 3000;
    _dio.options.contentType = Headers.formUrlEncodedContentType;
    _dio.options.headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  } // Configure dio

  static Future post(String path, Map<String, dynamic> data) async {
    configureDio();
    final formData = jsonEncode(data);
    try {
      final resp = await _dio.post(path, data: formData);
      return resp;
    } catch (e) {
      debugPrint(e.toString());
      throw ("An error has ocurred when try making the query post");
    }
  } // Register

  static Future get(String path) async {
    configureDio();
    return await _dio.get(path);
  }
}
