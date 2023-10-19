import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fw_base/util/color.dart';

class RegisterForgetWidget extends StatefulWidget{

  const RegisterForgetWidget({super.key});
  @override
  _RegisterForgetWidgetState createState() => _RegisterForgetWidgetState();

}

class _RegisterForgetWidgetState extends State<RegisterForgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "注册",
          style: TextStyle(fontSize: 27.sp, color: FwColor.button_blue),
        ),
        SizedBox(width: 100.w),
        Container(
          width: 2.w, // 设置竖线宽度
          height: 30.h, // 设置竖线高度
          color: Colors.blue, // 设置竖线颜色
        ),
        SizedBox(width: 80.w),
        Text(
          "忘记密码？",
          style: TextStyle(fontSize: 27.sp, color: FwColor.button_blue),
        )
      ],
    );
  }
}