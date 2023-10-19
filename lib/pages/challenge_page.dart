import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tv_music/base/base_state.dart';
import 'package:flutter_tv_music/base/base_statefulwidget.dart';
import 'package:flutter_tv_music/entity/home_variety.dart';
import 'package:flutter_tv_music/ui/challenge/challenge_title_widget.dart';

class ChallengePage extends BaseStatefulWidget {
  const ChallengePage({Key? key, this.onJumpTo}) : super(key: key);
  final ValueChanged<int>? onJumpTo;

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends BaseState<ChallengePage> {
  List<Data>? data;
  List<String> itemList = [];

  @override
  bool isSetSystemUIOverlayStyle() => false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h,),
        Expanded(child: ChallengeTitleWidget())
      ],
    );
  }
}
