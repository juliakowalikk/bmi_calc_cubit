import 'package:bmi_calc_cubit/bmi_class.dart';
import 'package:bmi_calc_cubit/cubit/bmi_cubit.dart';
import 'package:bmi_calc_cubit/cubit/bmi_state.dart';
import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:bmi_calc_cubit/style/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMMd('en_US').format(now);
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        final List<Result> resultHistory = state.resultHistory;
        return Column(
          children: [
            resultHistory.isEmpty
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(Dimens.xxl),
                    child: Text(
                      Strings.of(context).emptyHistory,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.style1,
                    ),
                  ))
                : Padding(
                    padding: const EdgeInsets.all(Dimens.l),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: resultHistory.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(Dimens.s),
                        child: Container(
                          decoration: const BoxDecoration(color: navyBlue),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(Dimens.xm),
                                    child: Text(
                                        Strings.of(context).historyBMI(
                                          resultHistory[index]
                                              .bmi
                                              .toStringAsFixed(2),
                                        ),
                                        style: MyTextStyle.style1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: Dimens.xm, bottom: Dimens.xm),
                                    child: Text(
                                      formattedDate,
                                      style: MyTextStyle.style10,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(Dimens.xm),
                                child: Text(
                                  Strings.of(context)
                                      .historyKg(resultHistory[index].weight),
                                  style: MyTextStyle.style10,
                                ),
                              ),
                              IconButton(
                                onPressed: () => context
                                    .read<BmiCubit>()
                                    .removeHistoryElement(index),
                                icon: const Icon(
                                  Icons.remove,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
