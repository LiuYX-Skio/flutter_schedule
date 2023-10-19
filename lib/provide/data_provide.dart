import 'package:flutter/cupertino.dart';

class SharedDataWidget extends InheritedWidget {
  final dynamic data;

  const SharedDataWidget({super.key, required this.data, required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(SharedDataWidget oldWidget) {
    return oldWidget.data != data;
  }

  static SharedDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedDataWidget>();
  }
}

