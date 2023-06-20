import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:bmi_calc_cubit/style/my_text_style.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() onPressed;
  final String title;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.xxl, horizontal: Dimens.s),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: pink),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.xxl),
              child: Text(
                title,
                style: MyTextStyle.style3,
              ),
            ),
          ),
        ),
      );
}
