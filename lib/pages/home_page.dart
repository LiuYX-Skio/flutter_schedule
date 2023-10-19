import 'package:banner_carousel/banner_carousel.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:flutter_tv_music/base/base_state.dart';
import 'package:flutter_tv_music/base/base_statefulwidget.dart';
import 'package:flutter_tv_music/entity/home_variety.dart';
import 'package:flutter_tv_music/provide/data_provide.dart';
import 'package:flutter_tv_music/ui/home/time_item_widget.dart';
import 'package:flutter_tv_music/ui/home/title_search_widget.dart';
import 'package:fw_base/util/color.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';

class HomePage extends BaseStatefulWidget {
  const HomePage({Key? key, this.onJumpTo}) : super(key: key);
  final ValueChanged<int>? onJumpTo;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  List<Data>? data;
  List<String> itemList = [];

  List<BannerModel> listBanners = [
    BannerModel(
        imagePath:
            "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg",
        id: "1"),
    BannerModel(
        imagePath:
            "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg",
        id: "2"),
    BannerModel(
        imagePath:
            "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg",
        id: "3"),
    BannerModel(
        imagePath:
            "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg",
        id: "4"),
  ];

  @override
  bool isSetSystemUIOverlayStyle() => false;

  @override
  void initState() {
    super.initState();
    itemList.add("定时闹钟");
    itemList.add("10点起床");
    itemList.add("12点起床");
  }

  void initUMeng() {
    UmengCommonSdk.initCommon(
        '5e3f96f3cb23d2a070000048', '5e3f96f3cb23d2a070000048', 'Umeng');
    UmengCommonSdk.setPageCollectionModeManual();
  }

  Future<void> _onRefresh() async {
    // 模拟下拉刷新操作，比如从网络或数据库获取最新数据
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // 更新数据源
      itemList = ['定时闹钟', '10点起床', '12点起床'];
    });
  }

  Future<void> _onLoadMore() async {
    // 模拟上拉加载更多操作，比如从网络或数据库获取更多数据
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // 添加更多数据到数据源
      itemList.addAll(['Load More Item 1', 'Load More Item 2']);
    });
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('自定义布局示例'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('这是一个自定义布局的AlertDialog。'),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: '请输入内容',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                // 在这里编写确认按钮的点击事件处理逻辑
                Navigator.of(context).pop();
              },
              child: const Text('确认'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            BannerCarousel.fullScreen(
              banners: listBanners,
              animation: false,
              height: 340.h,
              showIndicator: false,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40, left: 20),
              child: TitleSearchWidget(),
            )
          ],
        ),
        Container(
          height: 70.h,
          padding: EdgeInsets.only(left: 39.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("近期倒计时",
                  style: TextStyle(
                      color: FwColor.color565656,
                      fontSize: 27.sp,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              Container(
                  margin: EdgeInsets.only(right: 30.w),
                  child: GestureDetector(
                      onTap: () {
                        _showCustomDialog(context);
                      },
                      child: Image.asset("assets/images/add.png")))
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.h,
          color: FwColor.colorE9E9E9,
        ),
        Expanded(
          child: EasyRefresh(
            onRefresh: _onRefresh,
            onLoad: _onLoadMore,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return SwipeActionCell(
                  key: Key(itemList[index]),
                  trailingActions: [
                    SwipeAction(
                      color: Colors.red,
                      onTap: (handler) {
                        // 在这里执行删除操作，更新数据源
                        setState(() {
                          itemList.removeAt(index);
                        });
                        handler(false); // 关闭滑动菜单
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("$index 已删除")),
                        );
                      },
                      icon: const Icon(Icons.delete, color: Colors.white),
                    ),
                  ],
                  child: SharedDataWidget(
                    data: itemList[index],
                    child: const TimeItemWidget(),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
