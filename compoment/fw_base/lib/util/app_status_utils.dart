import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStatusUtils{
  static void setSystemUIOverlayStyle(){
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 设置状态栏颜色为透明
      statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为黑色
    ));
  }
}