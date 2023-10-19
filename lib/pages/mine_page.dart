import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/base/base_state.dart';
import 'package:flutter_tv_music/base/base_statefulwidget.dart';
import 'package:flutter_tv_music/entity/home_variety.dart';
import 'package:flutter_tv_music/provide/data_provide.dart';
import 'package:flutter_tv_music/ui/entity/mine_item_entity.dart';
import 'package:flutter_tv_music/ui/mine/mine_item_widget.dart';
import 'package:flutter_tv_music/ui/mine/mine_money_widget.dart';
import 'package:flutter_tv_music/ui/mine/mine_title_widget.dart';
import 'package:fw_base/util/color.dart';
import 'package:fw_base/util/string_utils.dart';

class MinePage extends BaseStatefulWidget {
  const MinePage({Key? key, this.onJumpTo}) : super(key: key);

  final ValueChanged<int>? onJumpTo;

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends BaseState<MinePage> {
  List<Data>? data;
  List<MineItemEntity> itemList = [];

  @override
  bool isSetSystemUIOverlayStyle() => false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    itemList.add(MineItemEntity.from("assets/images/buy_car.png", "我的购物车"));
    itemList.add(MineItemEntity.from("1", ""));
    itemList.add(MineItemEntity.from("assets/images/bind.png", "绑定提现账户"));
    itemList.add(MineItemEntity.from("1", ""));
    itemList.add(MineItemEntity.from("assets/images/sh_address.png", "收货地址管理"));
    itemList.add(MineItemEntity.from("", ""));
    itemList.add(MineItemEntity.from("assets/images/zx_kf.png", "在线客服"));
    itemList.add(MineItemEntity.from("1", ""));
    itemList.add(MineItemEntity.from("assets/images/edit_suggest.png", "意见反馈"));
    itemList.add(MineItemEntity.from("1", ""));
    itemList.add(MineItemEntity.from("assets/images/question.png", "APP使用说明"));
    itemList.add(MineItemEntity.from("1", ""));
    itemList.add(MineItemEntity.from("assets/images/share_mine.png", "分享APP"));
    itemList.add(MineItemEntity.from("", ""));
    itemList.add(MineItemEntity.from("assets/images/set_up.png", "系统设置"));
  }

  Widget itemBuilder(BuildContext context, int index) {
    if (StringUtils.isEmpty(itemList[index].imageUrl)) {
      return Container(
        width: double.infinity,
        height: 20.h,
        color: FwColor.colorF5F5F5,
      );
    } else if (itemList[index].imageUrl == "1") {
      return Container(
        margin: EdgeInsets.only(left: 70.w),
        width: double.infinity,
        height: 1.h,
        color: FwColor.colorE9E9E9,
      );
    }
    return SharedDataWidget(
      data: itemList[index],
      child: const MineItemWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MineTitleWidget(),
        const MineMoneyWidget(),
        Container(
          width: double.infinity,
          height: 20.h,
          color: FwColor.colorF5F5F5,
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: itemBuilder,
            itemCount: itemList.length,
          ),
        ),
      ],
    );
  }
}
