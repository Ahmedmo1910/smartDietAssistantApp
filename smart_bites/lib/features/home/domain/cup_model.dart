class CupModel {
  final bool filled;
  final bool addButton;

  CupModel({this.filled = false, this.addButton = false});
}

List<CupModel> generateCups(int totalCups, int filledCups) {
  return List.generate(totalCups, (i) {
    if (i < filledCups) return CupModel(filled: true);
    if (i == filledCups) return CupModel(addButton: true);
    return CupModel();
  });
}
