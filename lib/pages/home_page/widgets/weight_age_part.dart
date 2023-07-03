import 'package:bmi_calc_cubit/cubit/bmi_cubit.dart';
import 'package:bmi_calc_cubit/cubit/bmi_state.dart';
import 'package:bmi_calc_cubit/pages/home_page/tiles/weight_age_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeightAgePart extends StatelessWidget {
  const WeightAgePart({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) => Row(
          children: [
            Expanded(
              child: WeightAgeTile(
                  value: state.weight,
                  onIncrement: context.read<BmiCubit>().incrementWeight,
                  onDecrement: context.read<BmiCubit>().decrementWeight,
                  nameOfParameter: Strings.of(context).weight),
            ),
            Expanded(
              child: WeightAgeTile(
                  value: state.age,
                  onIncrement: context.read<BmiCubit>().incrementAge,
                  onDecrement: context.read<BmiCubit>().decrementAge,
                  nameOfParameter: Strings.of(context).age),
            )
          ],
        ),
      );
}
