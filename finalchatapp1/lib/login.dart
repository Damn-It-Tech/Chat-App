import 'package:finalchatapp1/signup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'firebase.dart';

String emailuser = '';
String passuser = '';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final email = TextEditingController();
  final password = TextEditingController();

  FirebaseAuthabc realauth = FirebaseAuthabc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Card(
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: email,
                decoration: InputDecoration(
                  hintText: "email",
                ),
                onChanged: (_) {
                  emailuser = email.text;
                  print(emailuser);
                },
              ),
            ),
            Card(
              child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "password",
                  ),
                  onChanged: (_) {
                    passuser = password.text;
                    print(passuser);
                  }),
            ),
            RaisedButton(
              child: Text('login'),
              onPressed: () async {
                dynamic singedin = await realauth.emaillogin();
                if (singedin == null) {
                  print('error');
                  Fluttertoast.showToast(msg: 'Error signing in');
                } else {
                  print(singedin);
                  print(singedin.email);
                  print('debugcheckpoint1 - signedinsuccess');
                  realauth.creatinguser();
                  Navigator.pushReplacementNamed(context, '/chats');
                }
              },
            ),
            RaisedButton(
              child: Text('signup'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Signupclass()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
