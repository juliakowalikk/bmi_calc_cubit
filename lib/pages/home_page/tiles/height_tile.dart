import 'package:bmi_calc_cubit/cubit/bmi_cubit.dart';
import 'package:bmi_calc_cubit/cubit/bmi_state.dart';
import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:bmi_calc_cubit/style/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeightTile extends StatefulWidget {
  const HeightTile({
    super.key,
  });

  @override
  State<HeightTile> createState() => _HeightTileState();
}

class _HeightTileState extends State<HeightTile> {
  @override
  Widget build(BuildContext context) => BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          double sliderValue = state.height;
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.xxl, horizontal: Dimens.s),
            child: Container(
              decoration: const BoxDecoration(color: darkBlue),
              child: Padding(
                padding: const EdgeInsets.all(Dimens.l),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Dimens.xl),
                      child: Text(
                        Strings.of(context).height,
                        style: MyTextStyle.style1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sliderValue.toStringAsFixed(0),
                          style: MyTextStyle.style2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Dimens.s),
                          child: Text(
                            Strings.of(context).cm,
                            style: MyTextStyle.style1,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Dimens.xl),
                      child: Slider(
                        min: 100,
                        max: 210,
                        divisions: 100,
                        thumbColor: pink,
                        value: sliderValue,
                        inactiveColor: grey,
                        activeColor: Colors.white,
                        onChanged: (double value) {
                          setState(() {
                            context.read<BmiCubit>().changeSliderValue(value);
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
}
