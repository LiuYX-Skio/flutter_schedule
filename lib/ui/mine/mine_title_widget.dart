import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/provide/data_provide.dart';
import 'package:flutter_tv_music/ui/entity/mine_item_entity.dart';
import 'package:fw_base/util/color.dart';

class MineTitleWidget extends StatefulWidget {
  const MineTitleWidget({super.key});

  @override
  _MineTitleWidgetState createState() => _MineTitleWidgetState();
}

class _MineTitleWidgetState extends State<MineTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 310.h,
          child: Image.asset("assets/images/person.png", fit: BoxFit.fill),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 50.h, right: 40.w),
          child: Image.asset(
            "assets/images/bell.png",
            width: 65.w,
            height: 65.w,
            alignment: Alignment.topRight,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 150.h, left: 50.w),
          child: Row(
            children: [
              Image.asset("assets/images/ic_launcher_round.png",
                  fit: BoxFit.fill, width: 137.w, height: 137.w),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "昵称",
                    style: TextStyle(color: Colors.white, fontSize: 32.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "13847212234",
                    style: TextStyle(color: Colors.white, fontSize: 24.sp),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
