import 'package:assignment/features/auth/domain/entity/user_login_entity.dart';
import 'package:assignment/features/auth/domain/entity/user_register_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> loginUser(UserLoginEntity userLoginEntity);
  Future<void> registerUser(UserRegisterEntity userRegisterEntity);
  Future<void> logoutUser();
}
