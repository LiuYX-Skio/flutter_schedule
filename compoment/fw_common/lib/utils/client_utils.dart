import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ClientUtils {
  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String> getIMEI() async {
    String deviceIMEINumber = await DeviceInformation.deviceIMEINumber;
    return deviceIMEINumber;
  }

  static Future<String> getAndroidId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.id;
  }

  static Future<String> getBrand() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.brand;
  }

  static Future<String> getBoard() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.board;
  }

  static Future<String> getManufacturer() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.manufacturer;
  }

  static Future<String> getModel() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.model;
  }

  static Future<String> getProduct() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.product;
  }

  static String getResolution(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return "$screenWidth*$screenHeight";
  }

  static String getDensity(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double devicePixelRatio = mediaQueryData.devicePixelRatio;
    return devicePixelRatio.toString();
  }

  static Future<String> getUniqueDeviceId() async {
    try {
      String udid = await FlutterUdid.consistentUdid;
      return udid;
    } catch (e) {
      return "";
    }
  }

}
