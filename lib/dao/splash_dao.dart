import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:fw_common/utils/parameter_utils.dart';
import 'package:fw_net/net/http/core/fw_net.dart';

import '../net/http/request/base_request.dart';
import '../net/http/request/splash_request.dart';

class SplashDao {
  static const AUTHORIZATION = "authorization";
  static const LOGIN = 0;
  static const REGISTER = 1;

  static loadSplash(BuildContext context) async {
    BaseRequest request = SplashRequest();
    HashMap<String, String> outParams = await ParameterUtils.getSystemCommonParameter(context);
    HashMap<String,String> params = ParameterUtils.getSignatureAllParameter(outParams);
    request.addAll(params);
    var result = await FwNet.getInstance().fire(request);
    print("数据接收结果$result");
  }

}