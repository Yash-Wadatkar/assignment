import 'package:assignment/features/auth/data/data_source/auth_data_source.dart';
import 'package:assignment/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:assignment/features/auth/domain/usecase/auth_usecase.dart';
import 'package:assignment/features/home/data/data_source/user_data_source.dart';
import 'package:assignment/features/home/data/repository_impl/user_repository_impl.dart';

import 'package:assignment/features/home/domain/usecase/user_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUp() {
  locator.registerSingleton(AuthDataSource());
  locator.registerSingleton(AuthRepositoryImpl());
  locator.registerSingleton(
      AuthUsecase(authRepository: locator<AuthRepositoryImpl>()));

  locator.registerSingleton(UserDataSource());
  locator.registerSingleton(UserRepositoryImpl());
  locator.registerSingleton(
      UserUsecase(userRepository: locator<UserRepositoryImpl>()));
}
