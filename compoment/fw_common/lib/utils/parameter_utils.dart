import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';

import 'package:flutter/cupertino.dart';
import 'package:fw_common/utils/client_utils.dart';

import 'string_utils.dart';


class ParameterUtils {
  static const String PASSWORD_ENCRYPTION = "c4fc9067d07349dag18g006d223g520g";

  /// 获取系统需要签名的公共参数
  static Future<HashMap<String, String>?>
      getSignatureSystemCommonParameter() async {
    HashMap<String, String>? hashMap = HashMap<String, String>();
    hashMap["uid"] =
        StringUtils.getNotNullParam(await ClientUtils.getAndroidId()); //设备号
    hashMap["umengchannel"] = "aliyunos";
    hashMap["version"] =
        StringUtils.getNotNullParam(await ClientUtils.getAppVersion()); //版本号
    hashMap["deviceinfo"] =
        StringUtils.getNotNullParam(await ClientUtils.getBoard()); //设备信息主板
    hashMap["customerworker"] =
        StringUtils.getNotNullParam(await ClientUtils.getBrand()); //系统定制商
    hashMap["cpudirect"] = ""; //cpu指令集
    hashMap["hardware"] = StringUtils.getNotNullParam(
        await ClientUtils.getManufacturer()); //硬件制作商
    hashMap["devicesstyle"] =
        StringUtils.getNotNullParam(await ClientUtils.getModel()); //设备型号
    hashMap["madefirm"] =
        StringUtils.getNotNullParam(await ClientUtils.getProduct()); //设备制作商
    hashMap["timestamp"] =
        DateTime.now().millisecondsSinceEpoch.toString(); //时间戳
    return hashMap;
  }

  /// 获取不需要签名的系统公共参数
  static Future<HashMap<String, String>> getNoSignatureSystemCommonParameter(
      HashMap<String, String>? hashMap, BuildContext context) async {
    if (hashMap == null) {
      return HashMap();
    }
    hashMap["fenbianlv"] =
        StringUtils.getNotNullParam(ClientUtils.getResolution(context)); //分辨率
    hashMap["dpi"] =
        StringUtils.getNotNullParam(ClientUtils.getDensity(context).toString());
    hashMap["runmemory"] = ProcessInfo.currentRss.toString(); //运行内存
    hashMap["systemversion"] = "2780"; //系统内存
    hashMap["sdcard"] = "94590"; //sd卡内存
    hashMap["tvmemory"] = "104590"; //电视内存
    hashMap["mac"] = StringUtils.getNotNullParam(
        await ClientUtils.getUniqueDeviceId()); //mac地址
    return hashMap;
  }

  /// 获取公共参数
  static Future<HashMap<String, String>> getCommonParameter() async {
    HashMap<String, String> hashMap = HashMap<String, String>();
    hashMap["umengchannel"] = "aliyunos";
    hashMap["uid"] = StringUtils.getNotNullParam(
        await ClientUtils.getUniqueDeviceId()); //设备号
    hashMap["version"] =
        StringUtils.getNotNullParam(await ClientUtils.getAppVersion()); //版本号
    hashMap["timestamp"] =
        DateTime.now().millisecondsSinceEpoch.toString(); //时间戳
    return hashMap;
  }

  /// 获取系统数据已签名的公共参数(如果没有其他参数可以直接调用此方法，这个方法返回所有公共参数，并且签名)
  static Future<HashMap<String, String>> getSystemCommonParameter(
      BuildContext context) async {
    HashMap<String, String>? params = await getSignatureSystemCommonParameter();
    params?["signature"] = getSignatureParameter(params);
    params = await getNoSignatureSystemCommonParameter(params, context);
    return params;
  }

  /// 将参数签名并返回
  static String getSignatureParameter(HashMap<String, String>? params) {
    return md5
        .convert(utf8.encode(PASSWORD_ENCRYPTION + appendParameter(params)))
        .toString();
  }

  /// 动态拼接参数
  /// @param hashMap 需要添加的参数
  static String appendParameter(HashMap<String, String>? hashMap) {
    if (hashMap == null) {
      return "";
    }
    dynamic paramsMap = sortMapByKey(hashMap);
    String params = "";
    paramsMap.forEach((key, value) {
      params = "$params&$key=$value";
    });
    if (!StringUtils.isEmpty(params.toString())) {
      params = params.substring(1);
    }
    return params.toString();
  }

  /// 将已传入的所有参数签名并上传
  static HashMap<String, String> getSignatureAllParameter(
      HashMap<String, String> hashMap) {
    hashMap["signature"] = getSignatureParameter(hashMap);
    return hashMap;
  }

  /// 使用 Map按key进行排序
  /// @param map
  /// @return
  static Map<String, String>? sortMapByKey(HashMap<String, String>? map) {
    if (map == null || map.isEmpty) {
      return null;
    }
    SplayTreeMap<String, String> sortedMap = SplayTreeMap.from(map);
    return sortedMap;
  }
}
