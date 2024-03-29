import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomAppBar extends StatelessWidget {
  final title;
  CustomAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: MyClipper(),
        child: Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [AppColor.primaryVariant, AppColor.primary],
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // put theme toggler
                  SizedBox(height: 50.0),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(this.title,
                          style: TextStyle(
                              color: AppColor.surface,
                              fontWeight: FontWeight.w600,
                              fontSize: 50.0)),
                    ),
                  )
                ])));
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
