import 'package:assignment/features/auth/domain/entity/user_login_entity.dart';
import 'package:assignment/features/auth/domain/entity/user_register_entity.dart';
import 'package:assignment/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUsecase {
  final AuthRepository authRepository;

  AuthUsecase({required this.authRepository});

  Future<UserCredential> loginUserUseCase(String email, String password) async {
    return authRepository
        .loginUser(UserLoginEntity(email: email, password: password));
  }

  Future<void> registerUserUsecase(
      String email, String password, String firstName, String lastName) async {
    authRepository.registerUser(UserRegisterEntity(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password));
  }

  Future<void> logOutUserUsecase() async {
    authRepository.logoutUser();
  }
}
