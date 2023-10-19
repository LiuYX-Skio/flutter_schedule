import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/ui/challenge/challenge_content_page.dart';
import 'package:fw_base/util/color.dart';

class ChallengeTitleWidget extends StatefulWidget {
  const ChallengeTitleWidget({super.key});

  @override
  _ChallengeTitleWidgetState createState() => _ChallengeTitleWidgetState();
}

class _ChallengeTitleWidgetState extends State<ChallengeTitleWidget>
    with SingleTickerProviderStateMixin {
  late List<Widget> _pages;
  late final TabController _tabController =
      TabController(length: _pages.length, vsync: this);
  final List<String> _tabs = ['圈子', '最新', '推荐', '关注', '我的'];

  @override
  void initState() {
    super.initState();
    _pages = [
      const ChallengeContentPage(),
      const ChallengeContentPage(),
      const ChallengeContentPage(),
      const ChallengeContentPage(),
      const ChallengeContentPage(),
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
          indicator: CustomIndicator(
            indicatorWidth: 70.w, // 设置指示器的宽度
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          // 设置选中状态下的间距
          padding: const EdgeInsets.only(left: 15),
          labelStyle: TextStyle(fontSize: 28.sp),
          // 设置选中状态下的间距
          tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
        ),
      ),
      Expanded(child: TabBarView(controller: _tabController, children: _pages))
    ]);
  }
}

class _CustomPainter extends BoxPainter {
  final double indicatorWidth;

  _CustomPainter(CustomIndicator decoration, this.indicatorWidth);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();
    paint.color = FwColor.button_blue; // 设置指示器的颜色
    double indicatorHeight = 4.0.h; // 设置指示器的高度
    final double indicatorTop = rect.bottom - indicatorHeight;
    final double indicatorLeft = offset.dx + (rect.width - indicatorWidth) / 2;
    final Rect indicatorRect = Rect.fromLTRB(
      indicatorLeft,
      indicatorTop,
      indicatorLeft + indicatorWidth,
      indicatorTop + indicatorHeight,
    );
    canvas.drawRect(indicatorRect, paint);
  }
}

class CustomIndicator extends Decoration {
  final double indicatorWidth;

  CustomIndicator({required this.indicatorWidth});

  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, indicatorWidth);
  }
}
