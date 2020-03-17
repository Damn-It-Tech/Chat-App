import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'firebase.dart';

String var1 = ''; //stores name
String var2 = ''; // stores email
String var3 = ''; // stores pass
String var4 = ''; //stores number

class Signupclass extends StatefulWidget {
  @override
  _SignupclassState createState() => _SignupclassState();
}

class _SignupclassState extends State<Signupclass> {
  FirebaseAuthabc realauth = FirebaseAuthabc();

  final nameA = TextEditingController();
  final numberA = TextEditingController();
  final emailA = TextEditingController();
  final passA = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SignUp Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up Page'),
        ),
        body: Container(
          child: Column(children: <Widget>[
            TextField(
              textInputAction: TextInputAction.next,
              controller: nameA,
              decoration: InputDecoration(
                hintText: "Name",
              ),
              onChanged: (_) {
                var1 = nameA.text;
                print(nameA.text);
              },
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: emailA,
              decoration: InputDecoration(
                hintText: "Email",
              ),
              onChanged: (_) {
                var2 = emailA.text;
                print(emailA.text);
              },
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: passA,
              decoration: InputDecoration(
                hintText: "pass",
              ),
              onChanged: (_) {
                var3 = passA.text;
                print(passA.text);
              },
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: numberA,
              decoration: InputDecoration(
                hintText: "Number",
              ),
              onChanged: (_) {
                var4 = numberA.text;
                print(numberA.text);
              },
            ),
            RaisedButton(
              child: Text('signup'),
              onPressed: () async {
                dynamic singedup = await realauth.emailsignupA();
                if (singedup == null) {
                  print('error');
                  Fluttertoast.showToast(msg: "Sign up Failed, email already exists!");
                } else {
                  print(singedup);
                  print(singedup.email);
                  print('SignedUp user');
                  Fluttertoast.showToast(msg: "Sign Up Successful, please login again");
                }
                Navigator.pop(context);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
