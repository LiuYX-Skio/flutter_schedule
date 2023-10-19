import 'package:flutter/material.dart';
import 'package:flutter_tv_music/pages/home_page.dart';

class HomeTitleWidget extends StatefulWidget {
  const HomeTitleWidget({super.key});

  @override
  _HomeTitleWidgetState createState() => _HomeTitleWidgetState();
}

class _HomeTitleWidgetState extends State<HomeTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("热门演唱会",style: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        Container(
          width: 10,
          height: 28,
          margin: const EdgeInsets.only(left: 10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF9966), Color(0xFFFF5E62)], // 设置渐变色
              ), // 设置 BoxDecoration 的背景色
              borderRadius: BorderRadius.all(Radius.circular(3))
          ),
        )
      ],
    );
  }

}
