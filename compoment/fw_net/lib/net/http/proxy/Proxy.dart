import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:http_proxy/http_proxy.dart';

class Proxy {

  // 是否启用代理
  static bool isProxy = true;

  // 设置成功代理IP过，就不再重复设置
  static bool proxyEd = false;

  /// 设置抓包
  static Future setProxy(Dio? dio) async {
    if (!isProxy || proxyEd || dio == null) return;

    HttpProxy? proxy = await HttpProxy.createHttpProxy();
    if (proxy?.host == null) {
      isProxy = false;
      return;
    }
    (dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.idleTimeout = const Duration(seconds: 5);
      client.findProxy = (uri) {
        proxyEd = true;
        return "PROXY ${proxy?.host}:${proxy?.port}";
      };
      // 代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
  }
}