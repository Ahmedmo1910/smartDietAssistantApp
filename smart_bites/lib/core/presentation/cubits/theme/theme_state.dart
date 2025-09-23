
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final bool isDark;
  ThemeLoaded({required this.isDark});
}

class ThemeChanged extends ThemeState {
  final bool isDark;
  ThemeChanged({required this.isDark});
}
