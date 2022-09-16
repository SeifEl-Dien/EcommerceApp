import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class FirestoreUser {
  final CollectionReference _usercollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _usercollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _usercollectionRef.doc(uid).get();
  }
}
