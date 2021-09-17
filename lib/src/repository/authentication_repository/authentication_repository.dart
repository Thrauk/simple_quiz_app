
abstract class AuthenticationRepository {
  Stream<String> get user;

  Future<void> signUpWithEmailAndPassword({required String email, required String password});

  Future<void> loginWithEmailAndPassword({required String email, required String password});

  Future<void> logOut();
  
}