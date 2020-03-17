import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
import 'login.dart';

FirebaseUser userlol;
final xyz = Firestore.instance;

class FirebaseAuthabc {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future emailsignupA() async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: var2, password: var3);
      FirebaseUser user = result.user;
      print(result.user);
      return user;
    } catch (e) {
      print(e.toString());
      print('error catched');
    }
  }

  Future emaillogin() async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: emailuser, password: passuser);
      userlol = result.user;
      print(userlol);
      return userlol;
    } catch (e) {
      print(e.toString());
      print('error catched');
    }
  }

  Future logout() async {
    return _auth.signOut();
  }

  Future creatinguser() async {
    if (userlol != null) {
      // Check if already sign up - code is below
      final QuerySnapshot result = await Firestore.instance
          .collection('users')
          .where('id', isEqualTo: userlol.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // Update data to server if new user
        Firestore.instance.collection('users').document(userlol.uid).setData({
          'nickname': var1,
          'id': userlol.uid,
          'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
          'chattingWith': null
        });
      }
    }
  }
}
