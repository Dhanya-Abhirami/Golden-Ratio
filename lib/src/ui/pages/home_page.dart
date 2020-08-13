import 'package:flutter/material.dart';
import 'package:golden_ratio/src/ui/pages/architecture_page.dart';
import 'package:golden_ratio/src/ui/widgets/navigation_drawer.dart';
import '../../../utils/constants.dart';
// import '../theme/theme.dart';
// final theme = Theme.of(context);

class HomePage extends StatefulWidget {
  final name;
  HomePage({this.name});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: NavigationDrawer(),
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Icon(Icons.menu, color: Colors.black),
            title: RichText(
              text: TextSpan(
                  text: 'Golden Ratio',
                  style: TextStyle(
                      fontFamily: 'Futur',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5b34b6),
                      fontSize: 20.0)),
            ),
            actions: <Widget>[
              Image(
                image: AssetImage('assets/logo.png'),
                height: 40.0,
                width: 40.0,
              )
            ]),
        body: ListView(children: <Widget>[
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                Text('Explore Domains',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0))
              ],
            ),
          ),
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
        ]));
  }

  Widget _buildListItem(String name, Color color) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(
              (MaterialPageRoute(builder: (context) => ArchitecturePage())));
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
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //         'https://images.vexels.com/media/users/3/143188/isolated/preview/5f44f3160a09b51b4fa4634ecdff62dd-money-icon-by-vexels.png'),
                  //     // NetworkImage(
                  //     //     'https://images.vexels.com/media/users/3/138647/isolated/preview/19bad593ff295a81e61c4a2a1a14cc06-3d-sacred-geometry-by-vexels.png'),
                  //     fit: BoxFit.fill),
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
