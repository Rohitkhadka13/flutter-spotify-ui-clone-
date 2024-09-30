import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SignInUseCase implements Usecase<Either, SigninUser> {
  @override
  Future<Either> call(SigninUser params) {
    return sl<AuthRepository>().signin(params);
  }
}
