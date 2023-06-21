abstract class BmiState {
  final double height;
  final int age;
  final int weight;
  final List<double> resultHistory;

  BmiState({
    this.resultHistory = const [],
    required this.age,
    required this.height,
    required this.weight,
  });
}

class BmiInitial extends BmiState {
  BmiInitial({
    super.age = 19,
    super.resultHistory,
    super.height = 170,
    super.weight = 60,
  });
}

class BmiCalculated extends BmiState {
  final double bmi;

  BmiCalculated(
      {required this.bmi,
      super.resultHistory,
      required super.age,
      required super.height,
      required super.weight});
}

class BmiSaved extends BmiState {
  final double bmi;

  BmiSaved(
      {required this.bmi,
      required super.resultHistory,
      required super.age,
      required super.height,
      required super.weight});
}
