import 'package:bmi_calc_cubit/cubit/bmi_cubit.dart';
import 'package:bmi_calc_cubit/cubit/bmi_state.dart';
import 'package:bmi_calc_cubit/pages/result_page/widgets/result_body.dart';
import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:bmi_calc_cubit/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultPage extends StatelessWidget {
  final double calculatedBmi;
  const ResultPage({
    super.key,
    required this.calculatedBmi,
  });

  @override
  Widget build(BuildContext context) => ScaffoldMessenger(
        child: BlocListener<BmiCubit, BmiState>(
          listener: _listener,
          child: BlocBuilder<BmiCubit, BmiState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: backgroundColor,
                appBar: AppBar(
                  backgroundColor: navyBlue,
                  title: Text(Strings.of(context).title),
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.xxl),
                    child: Column(
                      children: [
                        ResultBody(bmi: calculatedBmi),
                        Padding(
                          padding: const EdgeInsets.only(top: Dimens.xxxl),
                          child: MyButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              title: Strings.of(context).recalculate),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );

  void _listener(
    BuildContext context,
    BmiState state,
  ) {
    if (state is BmiSaved) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: navyBlue,
          content: Text(Strings.of(context).snackBarMessage),
        ),
      );
    }
  }
}
