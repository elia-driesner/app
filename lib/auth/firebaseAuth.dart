import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  late String email;
  late String password;

  Auth({required this.email, required this.password});

  Future<String?> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: this.email.toString(), password: this.password.toString());
      return ('User created');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('Weak password');
      } else if (e.code == 'email-already-in-use') {
        return ('Email already in use');
      }
    } catch (e) {
      return ('error');
    }
  }

  void signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");
      final user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        final name = user.displayName;
        final email = user.email;
        final photoUrl = user.photoURL;

        final emailVerified = user.emailVerified;

        final uid = user.uid;
        debugPrint(uid);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}
