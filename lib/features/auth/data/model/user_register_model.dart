import 'package:assignment/features/auth/domain/entity/user_register_entity.dart';

class UserRegisterModel extends UserRegisterEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  UserRegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        );

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password
    };
  }
}
