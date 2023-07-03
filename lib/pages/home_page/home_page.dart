import 'package:bmi_calc_cubit/cubit/bmi_cubit.dart';
import 'package:bmi_calc_cubit/cubit/bmi_state.dart';
import 'package:bmi_calc_cubit/pages/home_page/drawer_body.dart';
import 'package:bmi_calc_cubit/pages/home_page/tiles/height_tile.dart';
import 'package:bmi_calc_cubit/pages/home_page/widgets/gender_part.dart';
import 'package:bmi_calc_cubit/pages/home_page/widgets/weight_age_part.dart';
import 'package:bmi_calc_cubit/pages/result_page/result_page.dart';
import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:bmi_calc_cubit/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocListener<BmiCubit, BmiState>(
        listener: _listener,
        child: BlocBuilder<BmiCubit, BmiState>(
          builder: (context, state) => Scaffold(
            drawer: const DrawerBody(),
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
                    const GenderPart(),
                    const HeightTile(),
                    const WeightAgePart(),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Dimens.xm, left: Dimens.s, right: Dimens.s),
                      child: MyButton(
                        onPressed: context.read<BmiCubit>().calculateBMI,
                        title: Strings.of(context).calculate,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  void _listener(BuildContext context, BmiState state) {
    if (state is BmiCalculated) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ResultPage(
            calculatedBmi: state.bmi,
          ),
        ),
      );
    }
  }
}
