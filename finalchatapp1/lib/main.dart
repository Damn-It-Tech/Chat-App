import 'package:finalchatapp1/firestore_service.dart';
import 'package:finalchatapp1/newclass.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final FirestoreService _db = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (BuildContext context) => _db.getReports(),
      child: MaterialApp(
        home: Auth(), // auth is in login
        debugShowCheckedModeBanner: false,
        title: 'Chat App!',
        routes: {
          "/chats": (_) => AddDataToFireStore(),
          "/logout": (_) => Auth(),
        },
      ),
    );
  }
}
