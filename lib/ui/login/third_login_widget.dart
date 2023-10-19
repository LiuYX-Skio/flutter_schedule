import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fw_base/util/color.dart';

class ThirdLoginWidget extends StatefulWidget{

  const ThirdLoginWidget({super.key});

  @override
  _ThirdLoginWidgetState createState() => _ThirdLoginWidgetState();
}

class _ThirdLoginWidgetState extends State<ThirdLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/wechat.png",
                width: 70.w, height: 70.w),
            SizedBox(height: 22.h),
            Text("微信登录",
                style: TextStyle(
                    fontSize: 21.sp, color: FwColor.login_third))
          ],
        ),
        SizedBox(width: 87.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/qq.png",
                width: 70.w, height: 70.w),
            SizedBox(height: 22.h),
            Text("QQ登录",
                style: TextStyle(
                    fontSize: 21.sp, color: FwColor.login_third))
          ],
        )
      ],
    );
  }
}