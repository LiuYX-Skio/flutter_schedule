enum HttpMethod { GET, POST, DELETE }

/// 针对于使用层面
/// 常规情况的走的是header
/// 登录状态的保持在本地缓存，FwCache
abstract class FwBaseRequest {
  //统一的域名
  String authority();

  String authorization();

  String getToken();

  bool isForm();

  //参数
  var pathParams;
  Map<String, String> params = {}; //params

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
  FwBaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  ///添加header
  FwBaseRequest addHeader(String k, Object v) {
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
