import 'package:assignment/features/auth/data/model/user_login_model.dart';
import 'package:assignment/features/auth/data/model/user_register_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential> loginUserMetod(UserLoginModel userLoginModel) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
        email: userLoginModel.email,
        password: userLoginModel.password,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userEmail', userLoginModel.email);

      return user;
    } catch (e) {
      throw Exception('Failed to login user: $e');
    }
  }

  Future<void> registerUserMetod(UserRegisterModel userRegisterModel) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: userRegisterModel.email,
        password: userRegisterModel.password,
      );

      await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userRegisterModel.toMap());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userEmail', userRegisterModel.email);
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  Future<void> logOutUserMetod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userEmail');
    firebaseAuth.signOut();
  }
}
