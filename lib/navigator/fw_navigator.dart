import 'package:flutter/material.dart';
import 'package:flutter_tv_music/pages/home_page.dart';
import 'package:flutter_tv_music/pages/login_page.dart';
import 'package:flutter_tv_music/pages/scan_page.dart';

enum RouteStatus {
  login,
  registration,
  home,
  scan,
  unknown,
  target,
  target2,
  darkMode
}

RouteStatus getStatus(MaterialPage page) {
  if (page.child is HomePage) {
    return RouteStatus.home;
  } else if (page.child is LoginPage) {
    return RouteStatus.login;
  } else if (page.child is ScanPage) {
    return RouteStatus.scan;
  }else {
    return RouteStatus.unknown;
  }
}

class RouteStatusInfo {
  final RouteStatus routeStatus;
  final Widget page;

  RouteStatusInfo(this.routeStatus, this.page);
}

///获取routeStatus在页面栈中的位置
int getPageIndex(List<MaterialPage> pages, RouteStatus routeStatus) {
  for (int i = 0; i < pages.length; i++) {
    MaterialPage page = pages[i];
    if (getStatus(page) == routeStatus) {
      return i;
    }
  }
  return -1;
}

//监听
typedef RouteChangeListener(RouteStatusInfo current, RouteStatusInfo? pre);

class FwNavigator extends _RouteJumpListener {
  static FwNavigator? _instance;

  FwNavigator._();

  RouteJumpListener? _routeJump;

  //记录当前页面
  RouteStatusInfo? _current;

  List<RouteChangeListener> _listeners = [];

  ///监听路由页面跳转
  void addListener(RouteChangeListener listener) {
    if (!_listeners.contains(listener)) {
      _listeners.add(listener);
    }
  }

  void registerStatePage(
      Widget widget, VoidCallback onResume, VoidCallback onPause) {
    FwNavigator.getInstance().addListener((current, pre) {
      print("lis-current：$current");
      print("lis-pre：$pre");
    });
  }

  ///移除监听
  void removeListener(RouteChangeListener listener) {
    _listeners.remove(listener);
  }

  static FwNavigator getInstance() {
    _instance ??= FwNavigator._();
    return _instance!;
  }

  ///注册路由跳转逻辑
  void registerRouteJump(RouteJumpListener routeJumpListener) {
    this._routeJump = routeJumpListener;
  }

  @override
  void onJumpTo(RouteStatus routeStatus, {Map? args}) {
    _routeJump?.onJumpTo(routeStatus, args: args);
  }

  void notify(List<MaterialPage> currentPages, List<MaterialPage> prePages) {
    if (currentPages == prePages) return;
    var current =
        RouteStatusInfo(getStatus(currentPages.last), currentPages.last.child);
    _notify(current);
  }

  void _notify(RouteStatusInfo current) {
    print("_notify_currentCode:${current.routeStatus}");
    print("_notify_currentPage:${current.page}");
    _listeners.forEach((listener) {
      listener(current, _current);
    });
    _current = current;
  }

  RouteStatusInfo? _bottomTab;

  void onBottomTabChange(int index, Widget page) {
    _bottomTab = RouteStatusInfo(RouteStatus.home, page);
    _notify(_bottomTab!);
  }
}

///抽象类供FwNavigator实现
abstract class _RouteJumpListener {
  void onJumpTo(RouteStatus routeStatus, {Map args});
}

typedef OnJumpTo = void Function(RouteStatus routeStatus, {Map? args});

///定义路由跳转逻辑要实现的功能
class RouteJumpListener {
  final OnJumpTo onJumpTo;

  RouteJumpListener({required this.onJumpTo});
}
