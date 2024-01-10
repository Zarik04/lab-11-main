import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //   collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String fullName, String email, String password) async {
    return await users
        .doc(uid)
        .set({'name': fullName, 'email': email, 'password': password});
  }
}
