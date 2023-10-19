import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/provide/data_provide.dart';
import 'package:flutter_tv_music/ui/entity/mine_item_entity.dart';
import 'package:fw_base/util/color.dart';

class MineItemWidget extends StatefulWidget {
  const MineItemWidget({super.key});

  @override
  _MineItemWidgetState createState() => _MineItemWidgetState();
}

class _MineItemWidgetState extends State<MineItemWidget> {
  @override
  Widget build(BuildContext context) {
    MineItemEntity? data = SharedDataWidget.of(context)?.data;
    return SizedBox(
      height: 80.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w,
          ),
          Image.asset(
            data?.imageUrl ?? "",
            width: 36.w,
            height: 36.w,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            data?.title ?? "",
            style: TextStyle(fontSize: 28.sp, color: FwColor.color333333),
          ),
          const Expanded(
            child: Text(""),
          ),
          Image.asset(
            "assets/images/right_arrow.png",
            width: 12.w,
            height: 25.w,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
    );
  }
}
