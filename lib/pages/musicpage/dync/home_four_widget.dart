import 'package:flutter/material.dart';
import 'package:flutter_tv_music/entity/home_variety.dart';
import 'package:flutter_tv_music/navigator/fw_navigator.dart';
import 'package:flutter_tv_music/pages/home_page.dart';
import 'package:flutter_tv_music/provide/home_provide.dart';
import 'package:fw_base/util/string_utils.dart';

class HomeFourWidget extends StatefulWidget {
  const HomeFourWidget({super.key});

  @override
  _HomeFourWidgetState createState() => _HomeFourWidgetState();
}

class _HomeFourWidgetState extends State<HomeFourWidget> {
  List<TopicsListDetails>? list;

  @override
  Widget build(BuildContext context) {
    list = SharedHomeDataWidget.of(context)?.list?[1].topicsList?[0].topicsListDetails;
    return Row(
      children: _getList(),
    );
  }

  List<Widget> _getList() {
    List<Widget> inList = <Widget>[];
    if(list == null){
      return inList;
    }
    for (int i = 0; i < list!.length; i++) {
      inList.add(_getWidget(i));
      inList.add(const SizedBox(width: 15));
    }
    return inList;
  }

  Widget _getWidget(int position) {
    print("测试地址${list?[position].detailImg}");
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            FwNavigator.getInstance()
                .onJumpTo(RouteStatus.login);
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)), // 设置圆角弧度
            child: Image.network(
              list?[position].detailImg ?? "", // 替换为您的图片 URL
              fit: BoxFit.cover,
              width: 210,
              height: 150,
            ),
          ),
        ),
        SizedBox(
          width: 210,
          height: 150,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(visible: !StringUtils.isEmpty(list![position].name!),child: Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xFF1D2F60), // 设置 BoxDecoration 的背景色
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Text(
                list![position].name!,
                style: const TextStyle(fontSize: 14, color: Color(0xFFF0F0F0)),
              ),
            ),),
          ),
        )
      ],
    );
  }
}
