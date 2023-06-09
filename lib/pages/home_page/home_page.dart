import 'package:bmi_calc_cubit/cubit/bmi_cubit.dart';
import 'package:bmi_calc_cubit/cubit/bmi_state.dart';
import 'package:bmi_calc_cubit/pages/home_page/tiles/height_tile.dart';
import 'package:bmi_calc_cubit/pages/home_page/widgets/gender_part.dart';
import 'package:bmi_calc_cubit/pages/home_page/widgets/weight_age_part.dart';
import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: navyBlue,
              title: Text(Strings.of(context).title),
            ),
            body: Padding(
              padding: const EdgeInsets.all(Dimens.l),
              child: Column(
                children: const [
                  GenderPart(),
                  HeightTile(),
                  WeightAgePart(),
                ],
              ),
            ),
          );
        },
      );
}
