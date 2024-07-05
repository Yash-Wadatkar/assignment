import 'package:assignment/core/dependency_injection/dependency_injection_container.dart';
import 'package:assignment/features/home/data/data_source/user_data_source.dart';
import 'package:assignment/features/home/data/model/user_model.dart';
import 'package:assignment/features/home/domain/entity/user_entity.dart';
import 'package:assignment/features/home/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Stream<List<UserEntity>> getUsers() {
    // TODO: implement getUsers
    Stream<List<UserModel>> userList =
        locator<UserDataSource>().getUsersFromDataSource();
    return userList;
    // throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String email) async {
    locator<UserDataSource>().deleteDataFromSource(email);
    // TODO: implement deleteUser
    //throw UnimplementedError();
  }

  @override
  Future<void> updateUser(String email, UserEntity user) async {
    locator<UserDataSource>().updateUserData(
        email,
        UserModel(
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email));
    // TODO: implement updateUser
    //throw UnimplementedError();
  }
}
