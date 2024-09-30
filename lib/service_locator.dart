import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository_impl/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/usecase/auth/signin.dart';
import 'package:spotify_clone/domain/usecase/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<SignUpUseCase>(
    SignUpUseCase(),
  );
  sl.registerSingleton<SignInUseCase>(
    SignInUseCase(),
  );
}
