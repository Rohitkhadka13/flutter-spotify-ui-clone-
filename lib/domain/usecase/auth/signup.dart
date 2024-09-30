import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SignUpUseCase implements Usecase<Either,CreateUserReq>{
  
  
  @override
  Future<Either> call(CreateUserReq params) {
  return sl <AuthRepository>().signup(params);
  }

  }

