import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_bites/features/home/services/water_storage.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<WaterStorage>(() => WaterStorage(getIt()));
}
