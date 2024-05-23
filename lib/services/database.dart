import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  //GET
  final CollectionReference users =
      FirebaseFirestore.instance.collection('admin');
  //CREATE
  Future<void> addUser(String user) {
    return users.add({'admin': user, 'timestamp': Timestamp.now()});
  }

  //UPDATE
  //Read

  Stream<QuerySnapshot> getUsersStream() {
    final usersStream =
        users.orderBy('timestamp', descending: true).snapshots();
    return usersStream;
  }

  //DELETE
}
