import 'package:finalchatapp1/newclass.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Auth(), // auth is in login
      debugShowCheckedModeBanner: false,
      title: 'Chat App!',
      routes: {
        "/chats": (_) => AddDataToFireStore(),
        "/logout": (_) => Auth(),
      },
    );
  }
}
