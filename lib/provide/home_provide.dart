import 'package:flutter/cupertino.dart';
import 'package:flutter_tv_music/entity/home_variety.dart';

class SharedHomeDataWidget extends InheritedWidget {
  final List<Data>? list;

  SharedHomeDataWidget({required this.list, required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(SharedHomeDataWidget oldWidget) {
    return oldWidget.list != list;
  }

  static SharedHomeDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedHomeDataWidget>();
  }
}

