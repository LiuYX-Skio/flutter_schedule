import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

  void writeDataToFile(String data) {
    final file = File('log.txt');
    // 获取当前日期和时间
    DateTime now = DateTime.now();
    // 获取当前年份
    int currentYear = now.year;
    // 获取当前月份
    int currentMonth = now.month;
    // 获取当前日期
    int currentDay = now.day;
    String dataTime = ("$currentYear-$currentMonth-$currentDay").toString();
    file.writeAsStringSync(dataTime + data);
    print(data);
  }

}
