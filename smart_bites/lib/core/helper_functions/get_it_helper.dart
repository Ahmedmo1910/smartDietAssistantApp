import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_bites/core/services/firebase_auth_service.dart';
import 'package:smart_bites/features/auth/data/repos/auth_repo_imp.dart';
import 'package:smart_bites/features/auth/domain/repos/auth_repo.dart';
import 'package:smart_bites/features/home/services/water_storage.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<WaterStorage>(() => WaterStorage(getIt()));
}
