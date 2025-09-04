class WaterState {
  final int goalMl;
  final int cupSize;
  final int currentMl;

  const WaterState({
    required this.goalMl,
    required this.cupSize,
    required this.currentMl,
  });

  int get totalCups => (goalMl / cupSize).ceil();
  int get filledCups => (currentMl / cupSize).floor();
  double get progress => goalMl == 0 ? 0 : currentMl / goalMl;

  WaterState copyWith({int? goalMl, int? cupSize, int? currentMl}) {
    return WaterState(
      goalMl: goalMl ?? this.goalMl,
      cupSize: cupSize ?? this.cupSize,
      currentMl: currentMl ?? this.currentMl,
    );
  }
}
