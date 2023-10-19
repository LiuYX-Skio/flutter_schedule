import 'package:flutter/material.dart';
import 'package:flutter_tv_music/pages/home_page.dart';

class HomeSixWidget extends StatefulWidget {
  const HomeSixWidget({super.key});

  @override
  _HomeSixWidgetState createState() => _HomeSixWidgetState();
}

class _HomeSixWidgetState extends State<HomeSixWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [_getWidget(),const SizedBox(width: 15),_getWidget(),
          const SizedBox(width: 15),_getWidget(),const SizedBox(width: 15),
          _getWidget(),const SizedBox(width: 15),_getWidget(),const SizedBox(width: 15),_getWidget()
    ]
    );
  }

  Widget _getWidget() {
    return Container(
      width: 135,
      height: 210,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/test_image.png'), // 设置背景图片
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Color(0xFF1D2F60), // 设置 BoxDecoration 的背景色
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          child: const Text(
            "歌唱祖国",
            style: TextStyle(fontSize: 14, color: Color(0xFFF0F0F0)),
          ),
        ),
      ),
    );
  }
}
