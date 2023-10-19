import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/dao/user_dao.dart';
import 'package:flutter_tv_music/db/fw_cache.dart';
import 'package:flutter_tv_music/exception/Defend.dart';
import 'package:flutter_tv_music/navigator/bottom_navigator.dart';
import 'package:flutter_tv_music/navigator/fw_navigator.dart';
import 'package:flutter_tv_music/pages/scan_page.dart';
import 'package:flutter_tv_music/theme/provider.dart';
import 'package:flutter_tv_music/theme/theme_provider.dart';
import 'package:flutter_tv_music/pages/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  Defend().run(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final BiliRouteDelegate _routeDelegate = BiliRouteDelegate();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.red
          ),
          // home: Router(
          //   routerDelegate: _routeDelegate,
          // ),
          home: FutureBuilder(
            future: FwCache.preInit(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              //预加载没有结束，展示loding
              //结束之后切换路由界面进行展示
              var widget = snapshot.connectionState == ConnectionState.done
                  ? Router(routerDelegate: _routeDelegate)
                  : const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );

              return MultiProvider(
                  providers: topProviders,
                  child: Consumer<ThemeProvider>(builder: (BuildContext context,
                      ThemeProvider themeProvider, Widget? child) {
                    return MaterialApp(
                        home: widget,
                        theme: themeProvider.getTheme(),
                        darkTheme: themeProvider.getTheme(isDarkMode: true),
                        themeMode: themeProvider.getThemeMode());
                  }));
            },
          ),
        );
      },
    );
  }
}

MaterialPage pageWrap(Widget child) {
  return MaterialPage(key: ValueKey(child.hashCode), child: child);
}

///实际上就是把这个东西作为一个组件进行展示，触发builder切换堆栈
class BiliRouteDelegate extends RouterDelegate<BiliRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BiliRoutePath> {
  BiliRoutePath? path;

  //页面栈
  List<MaterialPage> pages = [];

  //当前页面
  RouteStatus _routeStatus = RouteStatus.home;

  //页面打开拦截
  RouteStatus get routeStatus {
    // if (_routeStatus != RouteStatus.registration && !hasLogin) {
    //   return _routeStatus = RouteStatus.login;
    // }
    //带入逻辑
    return _routeStatus;
  }

  bool get hasLogin => UserDao.getToken() != null;

  Map? _args;

  BiliRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    FwNavigator.getInstance().registerRouteJump(
        RouteJumpListener(onJumpTo: (RouteStatus routeStatus, {Map? args}) {
          _routeStatus = routeStatus;
          _args = args;
          notifyListeners();
        }));
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey;

  /// 管理栈区
  managerStack() {
    //获取在栈区中的位置
    var index = getPageIndex(pages, routeStatus);
    //截取栈区
    List<MaterialPage> tempPages = pages;
    if (index != -1) {
      tempPages = tempPages.sublist(0, index);
    }
    var page = getPage(routeStatus);
    //已经处理的
    //打开
    tempPages = [...tempPages, page];
    FwNavigator.getInstance().notify(tempPages, pages);
    //home --> login
    //原来的，当前页 home
    pages = tempPages;
  }

  MaterialPage getPage(RouteStatus status) {
    var page;
    if (status == RouteStatus.login) {
      pages.clear();
      page = pageWrap(const LoginPage());
    }else if (status == RouteStatus.home) {
      page = pageWrap(const BottomNavigator());
    }else if (status == RouteStatus.scan) {
      page = pageWrap(const ScanPage());
    }
    return page;
  }

  //页面处理
  @override
  Widget build(BuildContext context) {
    managerStack();
    //fix Android物理返回键，
    // 无法返回上一页问题@https://github.com/flutter/flutter/issues/66349
    return WillPopScope(
        child: Navigator(
          key: navigatorKey,
          pages: pages,
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }
            var tempPages = [...pages];
            //关闭页面通知路由变化
            pages.removeLast();
            FwNavigator.getInstance().notify(pages, tempPages);
            return true;
          },
        ),
        onWillPop: () async =>
        !(await navigatorKey?.currentState?.maybePop() ?? false));
  }

  @override
  Future<void> setNewRoutePath(BiliRoutePath path) async {
    this.path = path;
  }
}

class BiliRoutePath {
  final String location;

  BiliRoutePath.home() : location = "/";

  BiliRoutePath.detail() : location = "/detail";
}
