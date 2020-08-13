import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import './detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ArchitecturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      //

      SizedBox(height: 20.0),
      Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('Architecture',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0))),
      SizedBox(height: 20.0),
      // Future<void> downloadFile(StorageReference ref) async(
      //   final ref = FirebaseStorage.instance.ref().child('testimage');
      //   // no need of the file extension, the name will do fine.
      //   var url = await ref.getDownloadURL();
      //   print(url);
      // ),
      StreamBuilder(
          stream: Firestore.instance.collection('architecture').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ));
            }
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot =
                      snapshot.data.documents[index];
                  return InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        // Navigator.pushNamed(context, detailRoute);
                        Navigator.of(context).push((MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  name: documentSnapshot['name'],
                                  place: documentSnapshot['place'],
                                  imageUrl: documentSnapshot['image_url'],
                                  description: documentSnapshot['description'],
                                ))));
                      },
                      child: Container(
                          child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                        child: Container(
                          height: 200.0,
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0)
                              ],
                              image: DecorationImage(
                                image:
                                    NetworkImage(documentSnapshot['image_url']),
                                fit: BoxFit.fill,
                              )),
                          margin: EdgeInsets.all(5.0),
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    documentSnapshot['name'],
                                    style: TextStyle(
                                        fontSize: 25.0, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )));
                });
          })
    ]));
  }
}
