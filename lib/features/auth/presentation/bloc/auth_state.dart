sealed class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class LoadedState extends AuthState {}

class NavigateToHomeState extends AuthState {}

class ErrorState extends AuthState {
  final String error;

  ErrorState({required this.error});
}
