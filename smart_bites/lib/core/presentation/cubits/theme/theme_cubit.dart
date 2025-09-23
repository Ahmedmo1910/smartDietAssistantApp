import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'theme_state.dart';


class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool _isDark = false;
  bool get isDark => _isDark;

  Future<void> loadTheme() async {
    final prefs = getIt<SharedPreferences>();
    _isDark = prefs.getBool('isDark') ?? false;
    emit(ThemeLoaded(isDark: _isDark));
  }

  Future<void> toggleTheme() async {
    final prefs = getIt<SharedPreferences>();
    _isDark = !_isDark;
    await prefs.setBool('isDark', _isDark);
    emit(ThemeChanged(isDark: _isDark));
  }
}
