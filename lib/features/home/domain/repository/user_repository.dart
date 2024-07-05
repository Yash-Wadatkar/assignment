import 'package:assignment/features/home/domain/entity/user_entity.dart';

abstract class UserRepository {
  Stream<List<UserEntity>> getUsers();
  Future<void> deleteUser(String email);
  Future<void> updateUser(String email, UserEntity user);
}
