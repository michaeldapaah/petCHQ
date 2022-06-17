import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Human _userFromFirebase(person) {
    return person != null ? Human(uid: person.uid) : null;
  }

  Stream<Human> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future signup(
    String email,
    String password,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User person = result.user;

      //! create Database for user on Signup
      // await Database(uid: person.uid).updateData(
      //   "name",
      //   "email",
      //   233,
      // );
      //! Verification
      User student = await _auth.currentUser;
      if (!student.emailVerified && student != null) {
        student.sendEmailVerification();
      }

      return _userFromFirebase(person);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("Password provided is weak!");
      } else if (e.code == "email-already-in-use") {
        print('Account already in use');
      }
      return null;
    }
  }

  Future login(
    String email,
    String password,
  ) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User client = result.user;
      return _userFromFirebase(client);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found! \nTry creating a New Account!");
      } else if (e.code == "wrong-password") {
        print(
            'Invalid password provided... \nPlease try again with valid credentials');
      } else {
        print('An unknown error has occurred!\n Please try again later!');
      }
      return null;
    }
  }

  Future logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future delete() async {
    try {
      await _auth.currentUser.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must re-authenticate before this operation can be executed.');
      } else {
        print(e.toString());
        return null;
      }
    }
  }

  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class Human {
  final String uid;
  Human({this.uid});
}
