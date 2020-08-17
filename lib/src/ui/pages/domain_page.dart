import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_network_image.dart';
import 'detail_page.dart';

class DomainPage extends StatelessWidget {
  final domain;
  DomainPage({this.domain});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      CustomAppBar(
        title: domain,
      ),
      SizedBox(height: 20.0),
      StreamBuilder(
          stream:
              Firestore.instance.collection(domain.toLowerCase()).snapshots(),
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
                  return FutureBuilder(
                      future: getUrl(documentSnapshot['image_url']),
                      builder: (context, urlSnapshot) {
                        if (!urlSnapshot.hasData) {
                          return Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.lightBlueAccent,
                          ));
                        }
                        return InkWell(
                            splashColor: Colors.black,
                            onTap: () {
                              Navigator.of(context).push((MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        name: documentSnapshot['name'],
                                        place: documentSnapshot['place'],
                                        imageUrl: urlSnapshot.data,
                                        description:
                                            documentSnapshot['description'],
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
                                ),
                                margin: EdgeInsets.all(5.0),
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        customNetworkImage(
                                          urlSnapshot.data,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        Text(
                                          documentSnapshot['name'],
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )));
                      });
                });
          })
    ]));
  }
}

getUrl(String imageUrl) async {
  var pathReference = FirebaseStorage.instance.ref().child(imageUrl);
  String abc = await pathReference.getDownloadURL();
  return abc;
}
