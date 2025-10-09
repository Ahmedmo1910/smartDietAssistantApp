import 'package:get_it/get_it.dart';
import 'package:smart_bites/core/services/database_service.dart';
import 'package:smart_bites/core/services/firebase_auth_service.dart';
import 'package:smart_bites/core/services/firestore_service.dart';
import 'package:smart_bites/features/auth/data/repos/auth_repo_imp.dart';
import 'package:smart_bites/features/auth/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    databaseService: getIt<DatabaseService>()
  ));
}
