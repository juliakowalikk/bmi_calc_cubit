abstract class BmiState {
  final double height;
  final int age;
  final double bmi;
  final int weight;

  BmiState({
    required this.bmi,
    required this.age,
    required this.height,
    required this.weight,
  });
}

class BmiInitial extends BmiState {
  BmiInitial({
    super.bmi = 0,
    super.age = 19,
    super.height = 170,
    super.weight = 60,
  });
}
