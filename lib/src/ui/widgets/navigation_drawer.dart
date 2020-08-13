import 'package:flutter/material.dart';
import '../../config/route.dart';
import '../../../utils/constants.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Colors.lightBlueAccent,
              Colors.blueAccent
            ])),
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/logo.png',
                          width: 80,
                          height: 80,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Golden Ratio',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ))
                ],
              ),
            )),
        GListTile('About', () => Navigator.pushNamed(context, homeRoute)),
        GListTile('Architecture',
            () => Navigator.pushNamed(context, architectureRoute)),
        GListTile('Geometry', () => []),
        GListTile('Logo Design', () => [])
      ],
    ));
  }
}

class GListTile extends StatelessWidget {
  String text;
  Function onTap;
  GListTile(this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            splashColor: Colors.blueAccent,
            onTap: onTap,
            child: Container(
                height: 50,
                child: Row(children: <Widget>[
                  Row(
                    children: [
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
                          child: Text(
                            text,
                            style: TextStyle(fontSize: 16.0),
                          ))
                    ],
                  )
                ]))));
  }
}
