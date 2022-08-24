import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_engforit/user_models/users.dart';
import 'package:flutter_engforit/user_services/auth.dart';
import 'package:flutter_engforit/user_services/storage.dart';

class DatabaseService {
  final String uid;
  Users _currentUser;
  final AuthService _authService = AuthService();
  final Storage _storage = Storage();
  DatabaseService({this.uid});
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  // add user data
  Future addUser(email, password) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'password': password,
    });
  }

  Future updateUserInfo(String name, String password,
      int age, String image, String email) async {
    return await userCollection.doc(uid).set({
      'name':name,
      'password': password,
      'email': email,
      'age': age,
      'photo_url': image,
    });
  }

  Future<String> getDownloaImage() async {
    return await _storage.getUserImage(_currentUser.uid);
  }

  Future signIn(String email, String password) async {
    _currentUser = await _authService.signIn(email, password);
    _currentUser.photoUrl = await getDownloaImage();
  }

  Users _userFromSnapshot(DocumentSnapshot snapshot) {
    var docData = snapshot.data() as Map<String, dynamic>;
    return Users(
        uid: uid,
        name: docData['name'],
        age: docData['age'],
        email: docData['email'],
        password: docData['password'],
        photoUrl: docData['photo_url']);
  }

  Stream<Users> get userData {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }
}
