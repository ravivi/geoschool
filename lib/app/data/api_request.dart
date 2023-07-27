import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiRequest{
  final dio = Dio(); // 

void configureDio() {
  // Set default configs
  dio.options.baseUrl = 'https://inscriptions.etfp.ci/api/schools';
  dio.options.connectTimeout = Duration(seconds: 10);
  dio.options.receiveTimeout = Duration(seconds: 10);
  dio.options.followRedirects = false;
  dio.options.headers =  {
        'Accept': 'application/json',
      };
}
}