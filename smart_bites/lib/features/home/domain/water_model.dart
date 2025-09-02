class WaterModel {
  final int cupSize = 200; 
  int goalMl;   
  int currentMl;

  WaterModel({
    this.goalMl = 2000, 
    this.currentMl = 0,
  });

  int get totalCups => (goalMl / cupSize).ceil();
  int get filledCups => (currentMl / cupSize).floor();
  double get progress => currentMl / goalMl;
}
