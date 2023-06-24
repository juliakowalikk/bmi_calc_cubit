import 'package:bmi_calc_cubit/bmi_class.dart';
import 'package:bmi_calc_cubit/cubit/bmi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  final List<Result> _resultHistory = [];

  void changeSliderValue(double value) {
    emit(BmiInitial(
      height: value,
      weight: state.weight,
      age: state.age,
    ));
  }

  void incrementWeight() {
    emit(BmiInitial(
      weight: state.weight + 1,
      height: state.height,
      age: state.age,
    ));
  }

  void decrementWeight() {
    emit(BmiInitial(
      weight: state.weight - 1,
      height: state.height,
      age: state.age,
    ));
  }

  void incrementAge() {
    emit(BmiInitial(
      age: state.age + 1,
      height: state.height,
      weight: state.weight,
    ));
  }

  void decrementAge() {
    emit(BmiInitial(
      age: state.age - 1,
      height: state.height,
      weight: state.weight,
    ));
  }

  void calculateBMI() {
    final double height = state.height / 100;
    final double bmi = state.weight / (height * height);
    emit(BmiCalculated(
        bmi: bmi, age: state.age, height: state.height, weight: state.weight));
  }

  void saveResult(double bmi, int weight) {
    _resultHistory.add(Result(bmi: bmi, weight: weight));
    emit(BmiSaved(
        resultHistory: _resultHistory,
        bmi: bmi,
        age: state.age,
        height: state.height,
        weight: state.weight));
  }

  void removeHistoryElement(int index) {
    _resultHistory.removeAt(index);
    emit(BmiRemove(
        resultHistory: _resultHistory,
        age: state.age,
        height: state.height,
        weight: state.weight));
  }
}
