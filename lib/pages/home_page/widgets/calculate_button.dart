import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:bmi_calc_cubit/style/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalculateButton extends StatelessWidget {
  final Function() onCalculate;

  const CalculateButton({
    super.key,
    required this.onCalculate,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.xxl, horizontal: Dimens.s),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: pink),
            onPressed: () => onCalculate,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.xxl),
              child: Text(
                Strings.of(context).calculate,
                style: MyTextStyle.style3,
              ),
            ),
          ),
        ),
      );
}
