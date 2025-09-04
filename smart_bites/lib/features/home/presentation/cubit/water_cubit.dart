import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bites/features/home/presentation/cubit/water_state.dart';
import 'package:smart_bites/features/home/services/water_storage.dart';

class WaterCubit extends Cubit<WaterState> {
  final WaterStorage _storage;
  Timer? _midnightTimer;

  WaterCubit(this._storage)
    : super(
        WaterState(
          goalMl: _storage.getGoalMl(),
          cupSize: _storage.getCupSize(),
          currentMl: _storage.getCurrentMl(),
        ),
      ) {
    _scheduleMidnightReset();
  }

  Future<void> addCup() async {
    final newMl = (state.currentMl + state.cupSize).clamp(0, state.goalMl);
    emit(state.copyWith(currentMl: newMl));
    await _storage.saveWaterData(
      goalMl: state.goalMl,
      cupSize: state.cupSize,
      currentMl: newMl,
    );
  }

  Future<void> updateGoalAndCup({
    required int goalMl,
    required int cupSize,
  }) async {
    emit(state.copyWith(goalMl: goalMl, cupSize: cupSize, currentMl: 0));
    await _storage.saveWaterData(
      goalMl: goalMl,
      cupSize: cupSize,
      currentMl: 0,
    );
  }

  Future<void> reset() async {
    emit(state.copyWith(currentMl: 0));
    await _storage.saveWaterData(
      goalMl: state.goalMl,
      cupSize: state.cupSize,
      currentMl: 0,
    );
  }

  void _scheduleMidnightReset() {
    final now = DateTime.now();
    final midnight = DateTime(
      now.year,
      now.month,
      now.day,
    ).add(const Duration(days: 1));
    final duration = midnight.difference(now);
    _midnightTimer?.cancel();
    _midnightTimer = Timer(duration, () async {
      await reset();
      _scheduleMidnightReset();
    });
  }

  @override
  Future<void> close() {
    _midnightTimer?.cancel();
    return super.close();
  }
}
