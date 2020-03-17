import 'package:cloud_firestore/cloud_firestore.dart';
import 'report.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

  Stream<List<Report>> getReports() {
    return _db.collection('users')
        .snapshots()
        .map((snapshot) => snapshot
        .documents
        .map((document) => Report.fromJson(document.data))
        .toList());
  }
}
