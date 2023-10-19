import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/provide/data_provide.dart';
import 'package:flutter_tv_music/ui/entity/mine_item_entity.dart';
import 'package:fw_base/util/color.dart';

class MineMoneyWidget extends StatefulWidget {
  const MineMoneyWidget({super.key});

  @override
  _MineMoneyWidgetState createState() => _MineMoneyWidgetState();
}

class _MineMoneyWidgetState extends State<MineMoneyWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text("10.0",
                  style: TextStyle(
                      fontSize: 36.sp, color: FwColor.color333333)),
              SizedBox(height: 10.h),
              Text("钱包",
                  style: TextStyle(
                      fontSize: 24.sp, color: FwColor.color666666)),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
        Container(
          width: 1.w,
          height: 100.h,
          color: FwColor.colorE9E9E9,
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text("32.0",
                  style: TextStyle(
                      fontSize: 36.sp, color: FwColor.color333333)),
              SizedBox(height: 10.h),
              Text("订单",
                  style: TextStyle(
                      fontSize: 24.sp, color: FwColor.color666666)),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
        Container(
          width: 1.w,
          height: 100.h,
          color: FwColor.colorE9E9E9,
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text("34.0",
                  style: TextStyle(
                      fontSize: 36.sp, color: FwColor.color333333)),
              SizedBox(height: 10.h),
              Text("收藏",
                  style: TextStyle(
                      fontSize: 24.sp, color: FwColor.color666666)),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
