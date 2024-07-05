import 'dart:async';

import 'package:assignment/core/dependency_injection/dependency_injection_container.dart';
import 'package:assignment/features/auth/domain/usecase/auth_usecase.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment/features/auth/presentation/bloc/auth_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()) {
    on<AuthInitialEvent>(authInitialEvent);
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
    //on<RegisterButtonClickedEvent>(registerButtonClickedEvent);
  }

  FutureOr<void> authInitialEvent(AuthInitialEvent event, Emitter emit) {
    emit(InitialState());
  }

  FutureOr<void> loginButtonClickedEvent(
      LoginButtonClickedEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    try {
      final userCredential = await locator<AuthUsecase>()
          .loginUserUseCase(event.email, event.password);
      if (userCredential.user != null) {
        emit(LoadedState());
        emit(NavigateToHomeState());
      } else {
        emit(ErrorState(error: 'Authentication failed'));
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
      print('Error occurs: $e');
    }
  }

  // FutureOr<void> registerButtonClickedEvent(
  //     RegisterButtonClickedEvent event, Emitter<AuthState> emit) async {
  //   emit(LoadingState());
  //   try {
  //     await locator<AuthUsecase>().registerUserUsecase(
  //         event.email, event.password, event.firstName, event.lastName);
  //     emit(LoadedState());
  //     emit(NavigateToHomeState());
  //   }

  //   // on FirebaseAuthException catch (e) {
  //   //   if (e.code == 'email-already-in-use') {
  //   //     emit(ErrorState(error: e.toString()));
  //   //   } else {
  //   //     emit(ErrorState(error: e.toString()));
  //   //   }
  //   // }

  //   catch (e) {
  //     emit(ErrorState(error: e.toString()));
  //   }
  // }
}
