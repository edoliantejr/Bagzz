abstract class FireBaseAuthService {
  Future? loginWithEmail({required String email, required String password});

  Future? signUpWithEmail({required String email, required String password});
}
