import 'package:fw_net/net/http/request/base_request.dart';

import './base_request.dart';

class SplashRequest extends BaseRequest {

  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "is_service";
  }

}