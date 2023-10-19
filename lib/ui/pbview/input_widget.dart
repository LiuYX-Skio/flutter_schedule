import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/provide/data_provide.dart';
import 'package:flutter_tv_music/ui/entity/input_entity.dart';
import 'package:fw_base/util/color.dart';

///输入文本
class InputWidget extends StatefulWidget {
  static const int textPhone = 1;
  static const int textText = 2;
  static const int textNumber = 3;
  static const int textMultiline = 4;
  static const int textNone = 5;
  static const int visiblePassword = 6;
  static const int hidePassword = 7;

  const InputWidget({super.key});

  @override
  InputWidgetState createState() => InputWidgetState();
}

class InputWidgetState extends State<InputWidget> {

  final TextEditingController _controller =
      TextEditingController(); //声明controller

  TextInputType _getInputType(BuildContext context, InputEntity? data) {
    switch (data?.type) {
      case InputWidget.textPhone:
        return TextInputType.phone;
      case InputWidget.textText:
        return TextInputType.text;
      case InputWidget.textNumber:
        return TextInputType.number;
      case InputWidget.textMultiline:
        return TextInputType.visiblePassword;
      case InputWidget.visiblePassword:
        return TextInputType.multiline;
      case InputWidget.textNone:
        return TextInputType.none;
    }
    return TextInputType.text;
  }

  String getText() {
    return _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    InputEntity? data = SharedDataWidget.of(context)?.data;
    return TextField(
      controller: _controller,
      cursorColor: FwColor.button_blue,
      cursorHeight: 30.h,
      obscureText: data?.type == InputWidget.hidePassword,
      keyboardType: _getInputType(context, data),
      maxLines: 1,
      style: TextStyle(
        fontSize: 25.sp,
        color: FwColor.app_main_txt,
        height: 1.3,
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: FwColor.input_background,
        filled: true,
        // ImageIcon(AssetImage(data?.imageUrl ?? "")
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 45.0.w, right: 45.0.w),
          // 调整图标与文本框之间的间距
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(data?.imageUrl ?? "", width: 22, height: 22)
            ],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 30.0.w, vertical: data?.paddingVertical ?? 25.0.h),
        hintText: data?.hintText,
        hintStyle: TextStyle(fontSize: 23.sp, color: FwColor.input_hint),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: FwColor.input_stroke),
          // 设置未选中状态的边框颜色为蓝色
          borderRadius:
              data?.radios ?? const BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: FwColor.input_stroke),
          // 设置焦点状态的边框颜色为绿色
          borderRadius:
              data?.radios ?? const BorderRadius.all(Radius.circular(8)),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: FwColor.input_stroke),
          // 设置常规边框颜色为蓝色
          borderRadius:
              data?.radios ?? const BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
