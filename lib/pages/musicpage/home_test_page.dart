import 'package:flutter/material.dart';
import 'package:flutter_tv_music/dao/home_dao.dart';
import 'package:flutter_tv_music/dao/splash_dao.dart';
import 'package:flutter_tv_music/entity/home_variety.dart';
import 'package:flutter_tv_music/pages/musicpage/dync/home_four_widget.dart';
import 'package:flutter_tv_music/pages/musicpage/dync/home_six_widget.dart';
import 'package:flutter_tv_music/pages/musicpage/dync/home_title_widget.dart';
import 'package:flutter_tv_music/provide/home_provide.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key, this.onJumpTo}) : super(key: key);
  final ValueChanged<int>? onJumpTo;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  List<Data>? data;

  void loadHomeRecommend() async {
    data = await HomeDao.loadHomeRecommend();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadHomeRecommend();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SharedHomeDataWidget(
        list: data,
        child: ListView(
          children: const [
            HomeFourWidget(),
            SizedBox(height: 15),
            HomeTitleWidget(),
            SizedBox(height: 15),
            HomeSixWidget(),
            SizedBox(height: 15),
            HomeTitleWidget(),
            SizedBox(height: 15),
            HomeFourWidget(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
