import 'package:flutter/material.dart';
import 'package:golden_ratio/src/ui/pages/architecture_page.dart';
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
        body: ListView(children: <Widget>[
      ClipPath(
          clipper: MyClipper(),
          child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ],
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ArchitecturePage();
                            },
                          ));
                        },
                        child: Icon(Icons.menu)),
                    Text('\n\tGolden \n\t\t\t\tRatio',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 50.0)),
                  ]))),
      Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 10.0),
                Text('Explore Domains',
                    style: TextStyle(
                        color: Colors.black,
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
