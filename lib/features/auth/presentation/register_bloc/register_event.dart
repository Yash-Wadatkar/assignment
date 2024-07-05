sealed class RegisterEvent {}

class RegisterInitialEvent extends RegisterEvent {}

class RegisterButtonClickedEvent extends RegisterEvent {
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
