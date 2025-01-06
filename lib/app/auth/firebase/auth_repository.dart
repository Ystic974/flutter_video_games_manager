import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';


@injectable
class AuthRepository {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthRepository();



  signInWithEmailAndPassword({required String email, required String password}) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  createUserWithEmailAndPassword({required String email, required String password}) {
    return _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  signOut() {
    _firebaseAuth.signOut();
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;;
  }

  signInWithCredential(AuthCredential credential) {
    return _firebaseAuth.signInWithCredential(credential);
  }

  getGoogleSignInAccount() {
    return _googleSignIn.signIn();
  }



}
