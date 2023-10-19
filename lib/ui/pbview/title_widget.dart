import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/provide/data_provide.dart';
import 'package:fw_base/util/color.dart';

///标题
class TitleWidget extends StatefulWidget {
  const TitleWidget({super.key});

  @override
  _TitleWidget createState() => _TitleWidget();
}

class _TitleWidget extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35.h, left: 20.w, right: 20.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.white, // 用于显示背景色，方便观察Text的位置
            width: double.infinity,
            height: 60.h,
          ),
          Align(
            alignment: Alignment.centerLeft, // 使用Alignment.center水平居中
            child: Image.asset('assets/images/back.png',
                width: 20.w, height: 45.h),
          ),
          Align(
            alignment: Alignment.center, // 使用Alignment.center水平居中
            child: Text(
              SharedDataWidget.of(context)?.data ?? "",
              style: TextStyle(fontSize: 28.sp, color: FwColor.app_top_txt),
            ),
          ),
        ],
      ),
    );
  }
}
