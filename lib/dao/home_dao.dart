import 'dart:collection';
import 'dart:convert';

import 'package:flutter_tv_music/entity/home_variety.dart';
import 'package:fw_common/utils/parameter_utils.dart';
import 'package:fw_net/net/http/core/fw_net.dart';

import '../net/http/request/base_request.dart';
import '../net/http/request/home_request.dart';

class HomeDao {
  static const AUTHORIZATION = "authorization";
  static const LOGIN = 0;
  static const REGISTER = 1;

  static loadHomeRecommend() async {
    BaseRequest request = HomeTypesRequest();
    HashMap<String, String> map = await ParameterUtils.getCommonParameter();
    map["home_code"] = "4";
    request.addAll(ParameterUtils.getSignatureAllParameter(map));
    var result = await FwNet.getInstance().fire(request);
    List<Data>? data = HomeVariety.fromJson(jsonDecode(result)).data;
    return data;
  }

}
