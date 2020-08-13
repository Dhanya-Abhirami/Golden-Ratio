import 'package:flutter/material.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/detail_page.dart';
import '../ui/pages/architecture_page.dart';
import '../../utils/constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case architectureRoute:
        return MaterialPageRoute(builder: (_) => ArchitecturePage());
      case detailRoute:
        return MaterialPageRoute(builder: (_) => DetailPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
