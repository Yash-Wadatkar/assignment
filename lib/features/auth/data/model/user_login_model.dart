import 'package:assignment/features/auth/domain/entity/user_login_entity.dart';

class UserLoginModel extends UserLoginEntity {
  final String email;
  final String password;

  UserLoginModel({required this.email, required this.password})
      : super(email: email, password: password);
}
