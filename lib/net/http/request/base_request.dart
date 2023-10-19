import 'package:fw_net/net/http/request/base_request.dart';

import '../../../db/fw_cache.dart';

/// 针对于使用层面
/// 常规情况的走的是header
/// 登录状态的保持在本地缓存，FwCache
abstract class BaseRequest extends FwBaseRequest {

  //统一的域名
  String authority() {
    return "enter.ktvwin.com";
  }

  String authorization() {
    return "Authorization";
  }

  String getToken() {
    return FwCache.getInstance().get(authorization());
  }

  @override
  bool isForm() {
    return true;
  }

  //参数
  var pathParams; //http://baidu.com/x/aa
  Map<String, String> params = Map(); //params

  //请求头
  Map<String, dynamic> header = {};

  //往下延申的相关字段
  //地址
  String path();
  //请求方案get,post
  HttpMethod httpMethod();
  //是否登录
  bool needLogin();

  //是否是HTTPS
  bool isHttps = false;

  ///参数录入
  ///添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  ///参数录入
  ///添加参数
  BaseRequest addAll(Map<String, String> param) {
    params.addAll(param);
    return this;
  }

  ///添加header
  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }

  //登录参数配置处理

  String url() {
    Uri uri;

    var pathStr = path();

    //参数处理
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }

    var param;
    if (params.isNotEmpty && httpMethod() == HttpMethod.GET) {
      param = params;
    }

    if (isHttps) {
      uri = Uri.https(authority(), pathStr, param);
    } else {
      uri = Uri.http(authority(), pathStr, param);
    }

    if (needLogin()) {
      addHeader(authorization(), getToken());
    }

    return uri.toString();
  }
}