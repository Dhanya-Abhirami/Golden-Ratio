import "package:flutter/material.dart";
import 'src/ui/pages/home_page.dart';
import './src/config/route.dart';
import './utils/constants.dart';

void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Golden Ratio",
      home: HomePage(),
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
