import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseStorage storage =
      FirebaseStorage.instanceFor(bucket: 'gs://flutter-eft-final.appspot.com');
  Future<String> uploadUserImage(File file) async {
    var storageRef =
        storage.ref().child('user/profile/${_auth.currentUser.uid}');
    var uploadTask = storageRef.putFile(file);
    var completedTask = await uploadTask;
    String downloadUrl = await completedTask.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> getUserImage(String uid) async {
    var storageRef = storage.ref().child('user/profile/$uid');
    return await storageRef.getDownloadURL();
  }
}
