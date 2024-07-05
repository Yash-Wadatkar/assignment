import 'package:assignment/features/home/domain/entity/user_entity.dart';
import 'package:assignment/features/home/domain/repository/user_repository.dart';

class UserUsecase {
  final UserRepository userRepository;

  UserUsecase({required this.userRepository});
  Stream<List<UserEntity>> getUserUsecase() {
    return userRepository.getUsers();
  }

  Future<void> deleteUserUsecase(String email) async {
    userRepository.deleteUser(email);
  }

  Future<void> updateUserUsecase(String email, UserEntity user) async {
    userRepository.updateUser(email, user);
  }
}
