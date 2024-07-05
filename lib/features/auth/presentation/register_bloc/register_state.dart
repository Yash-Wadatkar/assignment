sealed class RegisterState {}

class RegisterInitialRegisterState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadedState extends RegisterState {}

class RegisterNavigateToHomeState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState({required this.error});
}
