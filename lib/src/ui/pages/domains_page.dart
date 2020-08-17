import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import 'domain_page.dart';

class DomainsPage extends StatefulWidget {
  DomainsPage();
  @override
  _DomainsPageState createState() => _DomainsPageState();
}

class _DomainsPageState extends State<DomainsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      CustomAppBar(title: 'Domains'),
      Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 10.0),
                Text('Explore Domains',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0)),
                SizedBox(height: 20.0),
                Container(
                  height: 150.0,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        _buildListItem('Architecture', Color(0xFFD82D40)),
                        _buildListItem('Geometry', Color(0xFF90AF17)),
                        _buildListItem('Finance', Color(0xFF2DBBD8)),
                        _buildListItem('Art', Color(0xFFD82D40)),
                        _buildListItem('Nature', Color(0xFF90AF17)),
                        _buildListItem('Logo Design', Color(0xFF2DBBD8)),
                      ],
                    ),
                  ),
                ),
              ]))
    ]);
  }

  Widget _buildListItem(String name, Color color) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push((MaterialPageRoute(
              builder: (context) => DomainPage(
                    domain: name,
                  ))));
        },
        child: Padding(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
            child: Container(
                height: 300.0,
                width: 150.0,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 6.0,
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5.0)
                  ],
                ),
                child: Center(
                    child: Text(name,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 14.0))))));
  }
}
