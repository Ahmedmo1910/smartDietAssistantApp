import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';



part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  bool _isDark = false;
  String _profileImage = '';

  bool get isDark => _isDark;
  String get profileImage => _profileImage;

  Future<void> loadPreferences() async {
    final prefs = getIt<SharedPreferences>();
    _isDark = prefs.getBool('isDark') ?? false;
    _profileImage = prefs.getString('profileImage') ?? '';
    emit(AppLoaded(isDark: _isDark, profileImage: _profileImage));
  }

  Future<void> changeMode() async {
    final prefs = getIt<SharedPreferences>();
    _isDark = !_isDark;
    await prefs.setBool('isDark', _isDark);
    emit(AppThemeChanged(isDark: _isDark, profileImage: _profileImage));
  }

  Future<void> changeProfileImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final prefs = getIt<SharedPreferences>();
      _profileImage = image.path;
      await prefs.setString('profileImage', _profileImage);
      emit(
        AppProfileImageChanged(isDark: _isDark, profileImage: _profileImage),
      );
    }
  }
}
