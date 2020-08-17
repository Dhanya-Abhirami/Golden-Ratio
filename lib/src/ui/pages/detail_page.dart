import 'package:flutter/material.dart';
import '../widgets/custom_network_image.dart';

class DetailPage extends StatefulWidget {
  final name;
  final place;
  final imageUrl;
  final description;

  DetailPage({this.name, this.place, this.imageUrl, this.description});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
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
                  fit: BoxFit.cover,
                ),
              )),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
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
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    Text(
                      widget.place,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Text(widget.name,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 15.0),
                Container(
                  child: Text(
                    widget.description,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(height: 15.0),
              ]))
    ]));
  }
}
