import 'package:bmi_calc_cubit/pages/history_page/widgets/history_page_list_view.dart';
import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: navyBlue,
          title: Text(Strings.of(context).historyTitle),
        ),
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(Dimens.s),
          child: Column(
            children: const [
              HistoryListView(),
            ],
          ),
        ),
      );
}
