import "package:flutter/material.dart";
import 'src/ui/pages/home_page.dart';
import 'src/ui/theme/theme.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Golden Ratio",
      home: HomePage(),
      theme: AppTheme.getThemeFromKey(ThemeType.LIGHT),
    );
  }
}
