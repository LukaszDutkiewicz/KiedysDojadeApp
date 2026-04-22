sealed class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => message;
}

class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException() : super('Nieprawidłowy e-mail lub hasło.');
}

class UserAlreadyExistsException extends AuthException {
  const UserAlreadyExistsException() : super('Konto z tym e-mailem już istnieje.');
}

class UnknownAuthException extends AuthException {
  const UnknownAuthException(super.message);
}
