import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/navigator/fw_navigator.dart';
import 'package:fw_base/util/color.dart';

class TitleSearchWidget extends StatefulWidget {
  const TitleSearchWidget({super.key});

  @override
  _TitleSearchWidgetState createState() => _TitleSearchWidgetState();
}

class _TitleSearchWidgetState extends State<TitleSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/bell.png",
            width: 60.w, height: 60.w, fit: BoxFit.fill),
        SizedBox(width: 20.w),
        Expanded(
          child: TextField(
            cursorColor: FwColor.button_blue,
            cursorHeight: 30.h,
            keyboardType: TextInputType.text,
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
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 15.0.h),
              hintText: "搜索商品名称",
              hintStyle: TextStyle(fontSize: 23.sp, color: FwColor.input_hint),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: FwColor.input_stroke),
                // 设置未选中状态的边框颜色为蓝色
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: FwColor.input_stroke),
                // 设置焦点状态的边框颜色为绿色
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: FwColor.input_stroke),
                // 设置常规边框颜色为蓝色
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        GestureDetector(
          onTap: (){
            FwNavigator.getInstance().onJumpTo(RouteStatus.scan);
          },
          child: Image.asset("assets/images/saosao.png",
              width: 60.w, height: 60.w, fit: BoxFit.fill),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
