import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase.dart';
import 'chat.dart';
import 'login.dart';
import 'package:flutter/material.dart';

class AddDataToFireStore extends StatefulWidget {
  @override
  _AddDataToFireStoreState createState() => _AddDataToFireStoreState();
}

String loggedusername;

class _AddDataToFireStoreState extends State<AddDataToFireStore> {
  final db = Firestore.instance;
  // This below widget is for the popup for confirmation of logout, BROKEN HAI BC
  Widget _buildAboutDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmation'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Do you want to logout?')],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            emailuser = '';
            passuser = '';
            Navigator.pushReplacementNamed(context, '/logout');
          },
          child: const Text('Yes'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('No'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildAboutDialog(context),
                );
              })
        ],
      ),
      body: Container(
        child: StreamBuilder(
          stream: Firestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemBuilder: (context, index) =>
                          buildItem(context, snapshot.data.documents[index]),
                      itemCount: snapshot.data.documents.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Logged in as : $loggedusername'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

Widget buildItem(BuildContext context, DocumentSnapshot document) {
  if (document['id'] == userlol.uid.toString()) {
    loggedusername = document['nickname'];
    return Container();
  } else {
    return Container(
      child: FlatButton(
        child: Row(
          children: <Widget>[
            Material(
              child: document['photoUrl'] != null
                  ? Icon(
                      Icons.account_circle,
                      size: 50.0,
                      color: Color(0xffaeaeae),
                    )
                  : Icon(
                      Icons.account_circle,
                      size: 50.0,
                      color: Color(0xffaeaeae),
                    ),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              clipBehavior: Clip.hardEdge,
            ),
            Flexible(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Nickname: ${document['nickname']}',
                        style: TextStyle(color: Color(0xff203152)),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                    ),
                    Container(
                      child: Text(
                        'About me: ${document['aboutMe'] ?? 'Not available'}',
                        style: TextStyle(color: Color(0xff203152)),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    )
                  ],
                ),
                margin: EdgeInsets.only(left: 20.0),
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Chat(
                        peerId: document.documentID,
                      )));
        },
        color: Color(0xffE8E8E8),
        padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
    );
  }
}
