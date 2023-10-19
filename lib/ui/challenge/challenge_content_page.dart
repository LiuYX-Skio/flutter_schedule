import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/pages/home_page.dart';
import 'package:fw_base/util/color.dart';

class ChallengeContentPage extends StatefulWidget {
  const ChallengeContentPage({super.key});

  @override
  _ChallengeContentPageState createState() => _ChallengeContentPageState();
}

class _ChallengeContentPageState extends State<ChallengeContentPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                CircleAvatar(
                  radius: 40.0.r, // 设置圆形头像的半径
                  backgroundImage: const AssetImage(
                      'assets/images/test_image.png'), // 设置头像图片
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "半首小情歌",
                      style: TextStyle(
                          color: FwColor.color282828, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "挑战，坚持阅读100天",
                      style: TextStyle(
                          color: FwColor.button_blue, fontSize: 32.sp),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: Text("第25次签到 2023/06/23",
                  style:
                      TextStyle(fontSize: 20.sp, color: FwColor.color010101)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w,right: 60.w),
              child: Text(
                "今天是第25天，从一开始的机械阅读，已经慢慢掌握了阅读技巧，也从中获得了阅读乐趣，最近阅读的都是图书馆借来的书，相信可以坚持到最后",
                style: TextStyle(fontSize: 24.sp, color: FwColor.color010101),
              ),
            ),
            Container(
              width: 400.w,
              height: 200.h,
              margin: EdgeInsets.only(left: 30.w,top:10.h,right: 60.w),
              child: Image.asset("assets/images/test_challenge.jpg", fit: BoxFit.fill,),
            )
          ],
        )
      ],
    );
  }
}
