import 'dart:async';

import 'package:assignment/core/dependency_injection/dependency_injection_container.dart';
import 'package:assignment/features/auth/domain/usecase/auth_usecase.dart';
import 'package:assignment/features/auth/presentation/register_bloc/register_event.dart';
import 'package:assignment/features/auth/presentation/register_bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialRegisterState()) {
    on<RegisterInitialEvent>(registerInitialEvent);
    on<RegisterButtonClickedEvent>(registerButtonClickedEvent);
  }

  FutureOr<void> registerInitialEvent(
      RegisterInitialEvent event, Emitter<RegisterState> emit) {
    emit(RegisterInitialRegisterState());
  }

  FutureOr<void> registerButtonClickedEvent(
      RegisterButtonClickedEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    try {
      await locator<AuthUsecase>().registerUserUsecase(
          event.email, event.password, event.firstName, event.lastName);
      emit(RegisterLoadedState());
      emit(RegisterNavigateToHomeState());
    } catch (e) {
      emit(RegisterErrorState(error: e.toString()));
    }
  }
}
