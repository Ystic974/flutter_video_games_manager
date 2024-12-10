import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'auth_state.dart';
import 'firebase/auth_repository.dart';


final authNotifierProvider =
StateNotifierProvider<AuthNotifier, AuthState>((ref) {
return GetIt.I.get<AuthNotifier>();
});


@injectable
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final firebase_auth.FirebaseAuth _firebaseAuth = firebase_auth.FirebaseAuth.instance;

  AuthNotifier(this._authRepository) : super(const AuthState.initial()) { }


  Future<void> signInWithEmail(String email, String password) async {
    try {
      state = state.setLoading(true);
      final userCredential = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = state.setAuthenticated(
        isAuthenticated: true,
        user: userCredential.user,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      state = state.setError(e.message);
    } finally {
      state = state.setLoading(false);
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      state = state.setLoading(true);
      final userCredential = await _authRepository.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = state.setAuthenticated(
        isAuthenticated: true,
        user: userCredential.user,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      state = state.setError(e.message);
    } finally {
      state = state.setLoading(false);
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
      state = state.signOut();
    } catch (e) {
      state = state.setError('Failed to sign out.');
    }
  }

  void checkAuthState() {
    final user = _authRepository.getCurrentUser();
    if (user != null) {
      state = state.setAuthenticated(
        isAuthenticated: true,
        user: user,
      );
    } else {
      state = const AuthState.initial();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _authRepository.getGoogleSignInAccount();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _authRepository.signInWithCredential(credential);

      state = state.setAuthenticated(
        isAuthenticated: true,
        user: userCredential.user,
      );
    } catch (e) {
      print('Google Sign-In failed: $e');
      throw Exception('Google Sign-In failed');
    }
  }



}