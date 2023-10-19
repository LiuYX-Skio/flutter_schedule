import 'package:flutter_tv_music/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> topProviders = [
  ChangeNotifierProvider(create: (_) => ThemeProvider())
];
