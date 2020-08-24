import 'package:flutter/material.dart';
import 'package:golden_ratio/src/ui/theme/colors.dart';
import '../widgets/custom_network_image.dart';
import '../widgets/share_service.dart';

class DetailPage extends StatefulWidget {
  final name;
  final imageUrl;
  final description;

  DetailPage({this.name, this.imageUrl, this.description});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey _containerKey = GlobalKey();
    return Scaffold(
        backgroundColor: AppColor.background,
        body: RepaintBoundary(
          key: _containerKey,
          child: ListView(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(height: 300.0),
                Container(
                    height: 250.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0)),
                      child: customNetworkImage(
                        widget.imageUrl,
                      ),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColor.background,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: AppColor.primary,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.background,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.share),
                      color: AppColor.primary,
                      onPressed: () {
                        Future.delayed(
                            Duration(seconds: 1),
                            () => convertWidgetToImageAndShare(
                                context, _containerKey));
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.name,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25.0,
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 15.0),
                      Container(
                        child: Text(
                          widget.description,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              color: AppColor.textDetail),
                        ),
                      ),
                      SizedBox(height: 15.0),
                    ]))
          ]),
        ));
  }
}
