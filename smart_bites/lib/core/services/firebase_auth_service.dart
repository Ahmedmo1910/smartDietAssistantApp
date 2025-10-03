import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_bites/core/errors/exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await _firebaseAuth.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status != LoginStatus.success ||
        loginResult.accessToken == null) {
      throw CustomException(message: 'Facebook login failed or was cancelled');
    }
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
import 'package:smart_bites/core/errors/exceptions.dart';
import 'dart:developer';

class FirebaseAuthService {
  // Create email and password ..............:)
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(name);
      await credential.user!.reload();

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'This account already exists. Please try signing in.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'Check Network Connection.');
      } else {
        throw CustomException(
          message: 'An error occurred. Please try again later.',
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(
        message: 'An error occurred. Please try again later.',
      );
    }
  }

  // Sign in with email and password ..............:)
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        throw CustomException(message: "No user returned from Firebase.");
      }
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: code=${e.code}, message=${e.message}");

      switch (e.code) {
        case 'user-not-found':
          throw CustomException(message: 'No user found for that email.');
        case 'wrong-password':
          throw CustomException(
            message: 'Wrong password provided for that user.',
          );
        case 'network-request-failed':
          throw CustomException(message: 'Check Network Connection.');
        case 'invalid-email':
          throw CustomException(message: 'The email address is invalid.');
        case 'user-disabled':
          throw CustomException(message: 'This user has been disabled.');
        default:
          throw CustomException(message: e.message ?? e.code);
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: e.toString());
    }
  }
}
