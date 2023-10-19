import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/navigator/fw_navigator.dart';
import 'package:flutter_tv_music/pages/challenge_page.dart';
import 'package:flutter_tv_music/pages/home_page.dart';
import 'package:flutter_tv_music/pages/mine_page.dart';
import 'package:fw_base/util/app_status_utils.dart';
import 'package:fw_base/util/color.dart';

///底部导航
class BottomNavigator extends StatefulWidget {

  const BottomNavigator({super.key});

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;
  static int initialPage = 0;
  final PageController _controller = PageController(initialPage: initialPage);
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    AppStatusUtils.setSystemUIOverlayStyle();
    _pages = const [HomePage(), ChallengePage(), HomePage(), MinePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) => _onJumpTo(index, pageChange: true),
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _onJumpTo(index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: FwColor.mainColor,
        unselectedItemColor: FwColor.mainGrey,
        selectedFontSize: 24.sp,
        unselectedFontSize: 24.sp,
        items: [
          _bottomItem('倒计时', 'assets/images/time_select.png',
              'assets/images/time_unselect.png', 0),
          _bottomItem('挑战营', 'assets/images/challenge_select.png',
              'assets/images/challenge_unselect.png', 1),
          _bottomItem('计划表', 'assets/images/schedule_select.png',
              'assets/images/schedule_unselect.png', 2),
          _bottomItem('我的', 'assets/images/mine_select.png',
              'assets/images/mine_unselect.png', 3),
        ],
      ),
    );
  }
  _bottomItem(
      String title, String selectImageUrl, String unSelectImageUrl, int index) {
    return BottomNavigationBarItem(
        icon: Column(
          children: [
            Image.asset(unSelectImageUrl, width: 25, height: 25),
            SizedBox(height: 6.h)
          ],
        ),
        activeIcon: Column(
          children: [
            Image.asset(selectImageUrl, width: 25, height: 25),
            SizedBox(height: 6.h)
          ],
        ),
        label: title);
  }

  void _onJumpTo(int index, {pageChange = false}) {
    if (!pageChange) {
      //让PageView展示对应tab
      _controller.jumpToPage(index);
    } else {
      FwNavigator.getInstance().onBottomTabChange(index, _pages[index]);
    }
    setState(() {
      //控制选中第一个tab
      _currentIndex = index;
    });
  }
}
