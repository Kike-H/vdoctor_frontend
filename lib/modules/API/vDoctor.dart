import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class VDoctorApi {
  static final Dio _dio = Dio();

  static void condigureDio() {
    //Base URL
    _dio.options.baseUrl = 'http://192.168.1.69:80';
    _dio.options.contentType = Headers.formUrlEncodedContentType;
    _dio.options.headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  } // Configure dio

  static Future post(String path, Map<String, dynamic> data) async {
    final formData = jsonEncode(data);
    condigureDio();
    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ("An error has ocurred when try making the query post");
    }
  } // Register
}
