import 'package:assignment/core/dependency_injection/dependency_injection_container.dart';
import 'package:assignment/features/auth/data/data_source/auth_data_source.dart';
import 'package:assignment/features/auth/data/model/user_login_model.dart';
import 'package:assignment/features/auth/data/model/user_register_model.dart';
import 'package:assignment/features/auth/domain/entity/user_login_entity.dart';
import 'package:assignment/features/auth/domain/entity/user_register_entity.dart';
import 'package:assignment/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserCredential> loginUser(UserLoginEntity userLoginEntity) async {
    // TODO: implement loginUser
    final user = await locator<AuthDataSource>().loginUserMetod(UserLoginModel(
        email: userLoginEntity.email, password: userLoginEntity.password));
    // throw UnimplementedError();
    return user;
  }

  @override
  Future<void> logoutUser() async {
    // TODO: implement logoutUser
    await locator<AuthDataSource>().logOutUserMetod();
    // throw UnimplementedError();
  }

  @override
  Future<void> registerUser(UserRegisterEntity userRegisterEntity) async {
    // TODO: implement registerUser
    await locator<AuthDataSource>().registerUserMetod(UserRegisterModel(
        firstName: userRegisterEntity.firstName,
        lastName: userRegisterEntity.lastName,
        email: userRegisterEntity.email,
        password: userRegisterEntity.password));
    // throw UnimplementedError();
  }
}
