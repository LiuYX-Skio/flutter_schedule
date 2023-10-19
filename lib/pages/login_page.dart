import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/base/base_state.dart';
import 'package:flutter_tv_music/base/base_statefulwidget.dart';
import 'package:flutter_tv_music/navigator/fw_navigator.dart';
import 'package:flutter_tv_music/provide/data_provide.dart';
import 'package:flutter_tv_music/ui/entity/input_entity.dart';
import 'package:flutter_tv_music/ui/login/register_forget_widget.dart';
import 'package:flutter_tv_music/ui/login/third_login_widget.dart';
import 'package:flutter_tv_music/ui/pbview/input_widget.dart';
import 'package:flutter_tv_music/ui/pbview/title_widget.dart';
import 'package:fw_base/util/color.dart';
import 'package:fw_base/util/string_utils.dart';
import 'package:fw_base/util/toast.dart';

///底部导航
class LoginPage extends BaseStatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {

  GlobalKey<InputWidgetState> phoneStateKey = GlobalKey(); // 创建 GlobalKey
  GlobalKey<InputWidgetState> pwdStateKey = GlobalKey(); // 创建 GlobalKey


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SharedDataWidget(data: "其它登录方式", child: TitleWidget()),
          Container(
            margin: EdgeInsets.only(left: 96.w, right: 96.w, top: 196.h),
            child: SharedDataWidget(
              data: InputEntity.from(
                  InputWidget.textPhone,
                  "请输入手机号码",
                  const BorderRadius.all(Radius.circular(43)),
                  25.h,
                  'assets/images/avatar.png'),
              child: InputWidget(
                key: phoneStateKey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 96.w, right: 96.w, top: 58.h),
            child: SharedDataWidget(
              data: InputEntity.from(
                  InputWidget.hidePassword,
                  "请输入密码",
                  const BorderRadius.all(Radius.circular(43)),
                  25.h,
                  'assets/images/padlock.png'),
              child: InputWidget(
                key: pwdStateKey,
              ),
            ),
          ),
          Container(
            height: 80.h,
            width: double.infinity,
            margin: EdgeInsets.only(left: 102.w, right: 102.w, top: 63.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(42.h), // 设置圆角半径
              color: FwColor.button_blue, // 设置背景颜色
            ),
            child: TextButton(
              onPressed: () {
                // 按钮被点击时执行的代码
                if(StringUtils.isEmpty(phoneStateKey.currentState?.getText()??"")){
                  showToast("请输入手机号");
                  return;
                }
                if(StringUtils.isEmpty(pwdStateKey.currentState?.getText()??"")){
                  showToast("请输入密码");
                  return;
                }
                FwNavigator.getInstance().onJumpTo(RouteStatus.home);
              },
              child: Text(
                '登录',
                style: TextStyle(fontSize: 31.sp, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 25.h),
          const RegisterForgetWidget(),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(bottom: 160.h),
            child: const ThirdLoginWidget(),
          ))
        ],
      ),
    );
  }
}
