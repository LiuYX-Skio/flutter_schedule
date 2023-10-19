import 'package:flutter/material.dart';
import 'package:flutter_tv_music/pages/home_page.dart';

class TitleWidget extends StatefulWidget {

  const TitleWidget({super.key});

  @override
  _TitleWidgetState createState() => _TitleWidgetState();

}

class _TitleWidgetState extends State<TitleWidget> with SingleTickerProviderStateMixin{

  late List<Widget> _pages;
  late final TabController _tabController =
  TabController(length: _pages.length, vsync: this);
  final List<String> _tabs = ['综艺秀', '点歌台', '热门推荐', '原创歌曲', '儿童专区', '长辈专区', '商城'];

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      Container(
          alignment: Alignment.centerLeft,
          height: 40,
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0), // 设置圆角半径
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFF5E62), Color(0xFFFF9966)], // 设置渐变的颜色
              ), // 设置背景颜色
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 28.0), // 设置选中状态下的间距
            padding: const EdgeInsets.only(left: 15), // 设置选中状态下的间距
            tabs: _tabs.map((tab) => Tab(
                text: tab
            )).toList(),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFFFFFFF)
                  ], // 设置选中选项卡的字体渐变颜色
                ).createShader(const Rect.fromLTRB(0, 0, 200, 70)),
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [
                    Color(0xFF9690a6),
                    Color(0xFF9690a6),
                  ], // 设置选中选项卡的字体渐变颜色
                ).createShader(const Rect.fromLTRB(0, 0, 200, 70)),
            ),
          )),
      Expanded(
          child: TabBarView(
              controller: _tabController,
              children: _pages))
    ]);
  }

}
