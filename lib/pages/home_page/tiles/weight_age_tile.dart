import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:bmi_calc_cubit/style/my_text_style.dart';
import 'package:flutter/material.dart';

class WeightAgeTile extends StatelessWidget {
  final int value;
  final Function() onIncrement;
  final Function() onDecrement;
  final String nameOfParameter;

  const WeightAgeTile({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    required this.nameOfParameter,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Dimens.s),
        child: Container(
          decoration: const BoxDecoration(color: darkBlue),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.l),
            child: Column(
              children: [
                Text(
                  nameOfParameter,
                  style: MyTextStyle.style1,
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimens.xl),
                  child: Text(
                    '$value',
                    style: MyTextStyle.style2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Dimens.m),
                      child: Container(
                        decoration: BoxDecoration(
                            color: navyBlue2,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(Dimens.s),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: onDecrement,
                            icon: const Icon(
                              Icons.remove,
                              color: white,
                              size: 45,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimens.xxl, horizontal: Dimens.m),
                      child: Container(
                        decoration: BoxDecoration(
                            color: navyBlue2,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(Dimens.s),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: onIncrement,
                            icon: const Icon(
                              Icons.add,
                              color: white,
                              size: 45,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
