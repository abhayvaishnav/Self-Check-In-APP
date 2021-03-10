import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final String uid;
  final String phoneNo;

  FirestoreService({this.phoneNo, this.uid});
  // collection reference
  final CollectionReference userDataCollectionRefrence =
      FirebaseFirestore.instance.collection('users');

  // get currentUserDataFromDB stream
  Stream<DocumentSnapshot> get currentUserDocFromDBMappedIntoLocalUserData {
    return userDataCollectionRefrence.doc(uid).snapshots();
  }
}
