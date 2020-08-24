import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:golden_ratio/src/ui/theme/colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_network_image.dart';
import 'detail_page.dart';

class DomainPage extends StatelessWidget {
  final domain;
  DomainPage({this.domain});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: ListView(children: <Widget>[
          CustomAppBar(
            title: domain,
          ),
          StreamBuilder(
              stream: Firestore.instance
                  .collection(domain.toLowerCase())
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: AppColor.accent,
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
                              return CustomTile(
                                  name: documentSnapshot['name'], imageUrl: '');
                            }
                            print('hi4');
                            return InkWell(
                                // splashColor: AppColor.grey,
                                onTap: () {
                                  Navigator.of(context).push((MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            name: documentSnapshot['name'],
                                            imageUrl: urlSnapshot.data,
                                            description:
                                                documentSnapshot['description'],
                                          ))));
                                },
                                child: CustomTile(
                                    name: documentSnapshot['name'],
                                    imageUrl: urlSnapshot.data));
                          });
                    });
              })
        ]));
  }
}

getUrl(String imageUrl) async {
  var pathReference = FirebaseStorage.instance.ref().child(imageUrl);
  String url = await pathReference.getDownloadURL();
  return url;
}

class CustomTile extends StatelessWidget {
  final name;
  final imageUrl;
  CustomTile({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xff29404E).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (imageUrl != null)
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          topLeft: Radius.circular(8)),
                      child: customNetworkImage(
                        this.imageUrl,
                      ),
                    ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      name,
                      style: TextStyle(color: AppColor.primary, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
