import 'package:flutter/material.dart';
import 'package:golden_ratio/src/ui/theme/colors.dart';
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
                        color: AppColor.primary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0)),
                SizedBox(height: 20.0),
                Container(
                  height: 150.0,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        _buildListItem('Architecture'),
                        _buildListItem('Art'),
                        _buildListItem('Finance'),
                        _buildListItem('Geometry'),
                        _buildListItem('Logo'),
                        _buildListItem('Nature'),
                      ],
                    ),
                  ),
                ),
              ]))
    ]);
  }

  Widget _buildListItem(String name) {
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
                    child: Text(name,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColor.textDetail,
                            fontSize: 20.0))))));
  }
}
