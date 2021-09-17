import 'package:flutter/services.dart';
import 'package:simple_quizz_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';

import 'failures.dart';

class FirebaseAuthRepository implements AuthenticationRepository {
  FirebaseAuthRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<FirebaseAuthFailure<String>?> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } on Exception {
      return const FirebaseAuthFailure<String>.serverFailure(failedValue: 'Server Failure');
    }
}

  @override
  Future<FirebaseAuthFailure<String>?> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on PlatformException {
      return const FirebaseAuthFailure<String>.emailAlreadyInUse(failedValue: 'Invalid email or password!');
    } on Exception {
      return const FirebaseAuthFailure<String>.serverFailure(failedValue: 'Server Failure');
    }
  }

  @override
  Future<FirebaseAuthFailure<String>?> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on PlatformException catch (e) {
      switch(e.code) {
        case 'email-already-in-use' : {
          return const FirebaseAuthFailure<String>.emailAlreadyInUse(failedValue: 'Email already in use!');
        }
        case 'invalid-email' : {
          return const FirebaseAuthFailure<String>.invalidEmail(failedValue: 'Email is invalid!');
        }
        case 'weak-password' : {
          return const FirebaseAuthFailure<String>.weakPassword(failedValue: 'Password is too weak!');
        }
      }
    } on Exception {
      return const FirebaseAuthFailure<String>.serverFailure(failedValue: 'Server Failure');
    }
  }


/*
  void Test() async {
    String emailError;
    final FirebaseAuthFailure<String>? failure = await signUpWithEmailAndPassword(email: "mailu Meu", password: "1234");
    if(failure != null) {
      failure.map(serverFailure: (ServerFailure<String> error) { emailError = error.failedValue; }

      );
    }


    errorText: state.email.errorText ?? state.email.errorText : null,
  } */

  @override
  // TODO: implement user
  Stream<String> get user => throw UnimplementedError();
}
