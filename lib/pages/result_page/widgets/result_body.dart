import 'package:bmi_calc_cubit/cubit/bmi_cubit.dart';
import 'package:bmi_calc_cubit/cubit/bmi_state.dart';
import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:bmi_calc_cubit/style/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultBody extends StatelessWidget {
  final double bmi;
  const ResultBody({
    super.key,
    required this.bmi,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: Dimens.xxl),
              child: Text(
                Strings.of(context).result,
                style: MyTextStyle.style4,
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: navyBlue),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.xxxl),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(Dimens.l),
                        child: Text(
                          shortResult(bmi, context),
                          style: MyTextStyle.style5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Dimens.l),
                        child: Text(
                          bmi.toStringAsFixed(1),
                          style: MyTextStyle.style8,
                        ),
                      ),
                      Text(
                        Strings.of(context).normalBMI,
                        style: MyTextStyle.style6,
                      ),
                      Text(
                        Strings.of(context).normBMI,
                        style: MyTextStyle.style7,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Dimens.xxxl),
                        child: Text(
                          resultDescription(bmi, context),
                          style: MyTextStyle.style7,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Dimens.xxxl),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: backgroundColor),
                          onPressed: () => context
                              .read<BmiCubit>()
                              .saveResult(bmi, state.weight),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.xxxl, vertical: Dimens.xxl),
                            child: Text(
                              Strings.of(context).save,
                              style: MyTextStyle.style9,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  String resultDescription(double bmi, context) {
    if (bmi < 18.5) {
      return Strings.of(context).underweightDescription;
    } else if (bmi < 25) {
      return Strings.of(context).normalWeightDescription;
    } else if (bmi < 30) {
      return Strings.of(context).overweightDescription;
    } else {
      return Strings.of(context).obesityDescription;
    }
  }

  String shortResult(double bmi, context) {
    if (bmi < 18.5) {
      return Strings.of(context).underweightTitle;
    } else if (bmi < 25) {
      return Strings.of(context).normalWeightTitle;
    } else if (bmi < 30) {
      return Strings.of(context).overweightTitle;
    } else {
      return Strings.of(context).obesityTitle;
    }
  }
}
