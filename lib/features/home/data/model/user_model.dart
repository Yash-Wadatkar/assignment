import 'package:assignment/features/home/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final String firstName;
  final String lastName;
  final String email;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : super(
          email: email,
          firstName: firstName,
          lastName: lastName,
        );

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
