import 'package:bmi_calc_cubit/cubit/bmi_cubit.dart';
import 'package:bmi_calc_cubit/cubit/bmi_state.dart';
import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:bmi_calc_cubit/style/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          final List<double> resultHistory = state.resultHistory;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: resultHistory.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(Dimens.s),
                child: ListTile(
                  tileColor: navyBlue,
                  title: Text(resultHistory[index].toStringAsFixed(2),
                      style: MyTextStyle.style1),
                ),
              );
            },
          );
        },
      );
}
