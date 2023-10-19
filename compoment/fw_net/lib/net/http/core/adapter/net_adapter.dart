import 'dart:convert';

import '../../request/base_request.dart';

///网络请求抽象类
abstract class FwNetAdapter {
  Future<FwNetResponse<T>> send<T>(FwBaseRequest request);
}

/// 统一网络层返回格式
class FwNetResponse<T> {
  FwNetResponse({
    this.data,
    required this.request,
    this.statusCode,
    this.statusMessage,
    this.extra,
  });

  /// 相应body中内容
  T? data;

  /// 请求信息
  FwBaseRequest request;

  /// code
  int? statusCode;

  //相应消息
  String? statusMessage;

  /// 扩展字段
  late dynamic extra;

  /// 格式化数据
  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
