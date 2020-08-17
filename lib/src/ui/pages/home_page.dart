import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../widgets/custom_appbar.dart';
import './domains_page.dart';
import './plot_screen.dart';

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
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).backgroundColor,
          animationDuration: Duration(milliseconds: 200),
          index: _curIndex,
          items: <Widget>[
            Icon(Icons.domain, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.lightbulb_outline, size: 30),
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
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0)),
                SizedBox(height: 20.0)
              ]))
    ]);
  }
}
