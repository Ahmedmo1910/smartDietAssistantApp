import 'package:shared_preferences/shared_preferences.dart';

class WaterStorage {
  static const _goalKey = 'goalMl';
  static const _cupKey = 'cupSize';
  static const _currentKey = 'currentMl';

  final SharedPreferences _prefs;

  WaterStorage(this._prefs);

  Future<void> saveWaterData({
    required int goalMl,
    required int cupSize,
    required int currentMl,
  }) async {
    await _prefs.setInt(_goalKey, goalMl);
    await _prefs.setInt(_cupKey, cupSize);
    await _prefs.setInt(_currentKey, currentMl);
  }

  int getGoalMl() => _prefs.getInt(_goalKey) ?? 2000;
  int getCupSize() => _prefs.getInt(_cupKey) ?? 200;
  int getCurrentMl() => _prefs.getInt(_currentKey) ?? 0;
}
