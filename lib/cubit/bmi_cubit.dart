import 'package:bloc/bloc.dart';
import 'package:bmi_calc_cubit/cubit/bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial(0));
}
