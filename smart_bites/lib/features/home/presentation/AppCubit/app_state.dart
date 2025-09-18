part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppLoaded extends AppState {
  final bool isDark;
  final String profileImage;
  AppLoaded({required this.isDark, required this.profileImage});
}

class AppThemeChanged extends AppState {
  final bool isDark;
  final String profileImage;
  AppThemeChanged({required this.isDark, required this.profileImage});
}

class AppProfileImageChanged extends AppState {
  final bool isDark;
  final String profileImage;
  AppProfileImageChanged({required this.isDark, required this.profileImage});
}
