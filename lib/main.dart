import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'src/ui/pages/home_page.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Golden Ratio",
      home: HomePage(),
    );
  }
}
