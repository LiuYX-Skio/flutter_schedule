import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/provide/data_provide.dart';
import 'package:flutter_tv_music/ui/entity/input_entity.dart';
import 'package:fw_base/util/color.dart';

class TimeItemWidget extends StatefulWidget {

  const TimeItemWidget({super.key});
  @override
  _TimeItemWidgetWidgetState createState() => _TimeItemWidgetWidgetState();

}

class _TimeItemWidgetWidgetState extends State<TimeItemWidget> {

  @override
  Widget build(BuildContext context) {
    String data = SharedDataWidget.of(context)?.data;
    return Column(
      children: [
        SizedBox(height: 25.h),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 40.w),
              child: Text(data,
                  style: TextStyle(
                      fontSize: 24.sp, color: FwColor.app_main_txt)),
            )
          ],
        ),
        SizedBox(height: 25.h),
        Container(
          margin: EdgeInsets.only(left: 40.w, right: 40.w),
          width: double.infinity,
          height: 1.h,
          color: FwColor.colorE9E9E9,
        ),
      ],
    );
  }
}
