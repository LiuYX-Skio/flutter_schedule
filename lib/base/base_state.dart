import 'package:flutter/material.dart';
import 'package:fw_base/util/app_status_utils.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  bool isSetSystemUIOverlayStyle() {
    return true;
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    } else {
      print('页面已销毁，本次setState不执行：${toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    if (isSetSystemUIOverlayStyle()) {
      AppStatusUtils.setSystemUIOverlayStyle();
    }
  }
}
