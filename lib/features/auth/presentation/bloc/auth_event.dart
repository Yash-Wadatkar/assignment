sealed class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class LoginButtonClickedEvent extends AuthEvent {
  final String email;
  final String password;

  LoginButtonClickedEvent({required this.email, required this.password});
}

class RegisterButtonClickedEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegisterButtonClickedEvent(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}
