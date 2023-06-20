import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:bmi_calc_cubit/style/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultBody extends StatelessWidget {
  final double bmi;
  const ResultBody({
    super.key,
    required this.bmi,
  });

  @override
  Widget build(BuildContext context) => Column(
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
                        shortResult(bmi),
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
                        resultDescription(bmi),
                        style: MyTextStyle.style7,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Dimens.xxxl),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: backgroundColor),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimens.xxxl, vertical: Dimens.xxl),
                          child: Text(
                            Strings.of(context).save,
                            style: MyTextStyle.style9,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
  String resultDescription(double bmi) {
    if (bmi < 18.5) {
      return "Your weight is less than it ideally should be.";
    } else if (bmi < 25) {
      return 'Your BMI is currently within what is considered a healthy weight range.';
    } else if (bmi < 30) {
      return 'Your weight appears to be a bit above the ideal range.';
    } else {
      return 'You currently weigh more than is ideal.';
    }
  }

  String shortResult(double bmi) {
    if (bmi < 18.5) {
      return "UNDERWEIGHT";
    } else if (bmi < 25) {
      return 'NORMAL';
    } else if (bmi < 30) {
      return 'OVERWEIGHT';
    } else {
      return 'OBESITY';
    }
  }
}
