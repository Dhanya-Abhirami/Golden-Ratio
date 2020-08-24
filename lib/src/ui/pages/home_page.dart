import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../widgets/custom_appbar.dart';
import './domains_page.dart';
import './plot_screen.dart';
import '../theme/colors.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curIndex = 1;
  final tabs = [DomainsPage(), Home(), PlotPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          color: AppColor.primary,
          backgroundColor: AppColor.background,
          animationDuration: Duration(milliseconds: 200),
          index: _curIndex,
          items: <Widget>[
            Icon(Icons.lightbulb_outline, size: 30, color: AppColor.background),
            Icon(Icons.home, size: 30, color: AppColor.background),
            Icon(Icons.flare, size: 30, color: AppColor.background),
          ],
          onTap: (index) {
            setState(() {
              _curIndex = index;
            });
          },
        ),
        body: tabs[_curIndex]);
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      CustomAppBar(title: 'Golden Ratio'),
      Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 10.0),
                Text('About',
                    style: TextStyle(
                        color: AppColor.primary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0)),
                SizedBox(height: 20.0),
                Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                    child: Container(
                        height: 100.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: AppColor.surface,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: AppColor.border,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6.0,
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5.0)
                          ],
                        ),
                        child: Center(
                            child: Text('φ = 1.61803',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.textDetail,
                                    fontSize: 20.0)))))
              ]))
    ]);
  }
}
