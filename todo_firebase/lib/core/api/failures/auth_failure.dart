

abstract class AuthFailure{}

class ServerFailure extends AuthFailure{}
class EmailAlreadyInUseFailure extends AuthFailure{}
class PasswordTooShortFailure extends AuthFailure{}
class InvalidEmailAndPassCombFailure extends AuthFailure{}