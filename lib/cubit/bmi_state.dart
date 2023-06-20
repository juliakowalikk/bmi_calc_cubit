abstract class BmiState {
  final double height;
  final int age;
  final int weight;

  BmiState({
    required this.age,
    required this.height,
    required this.weight,
  });
}

class BmiInitial extends BmiState {
  BmiInitial({
    super.age = 19,
    super.height = 170,
    super.weight = 60,
  });
}

class BmiCalculated extends BmiState {
  final double bmi;

  BmiCalculated(
      {required this.bmi,
      required super.age,
      required super.height,
      required super.weight});
}
