import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUser signinUser);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return const Right("Signup was Successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'invalid-email') {
        message = 'The email provided is invalid.';
      } else {
        message = 'Signup failed. Please try again.';
      }
      return left(message);
    }
  }

  @override
  Future<Either> signin(SigninUser signinUser) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUser.email,
        password: signinUser.password,
      );
      return const Right("Signin was Successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'The password is incorrect.';
      } else if (e.code == 'invalid-email') {
        message = 'The email provided is invalid.';
      } else {
        message = 'Signin failed. Please try again.';
      }
      return left(message);
    }
  }
}
