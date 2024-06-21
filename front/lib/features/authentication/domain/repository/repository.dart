abstract interface class AuthenticationRepository {
  Future<void> signUp({required String email, required String password});

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();
}
