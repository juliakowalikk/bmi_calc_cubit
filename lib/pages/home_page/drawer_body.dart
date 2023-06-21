import 'package:bmi_calc_cubit/pages/history_page/history_page.dart';
import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: pink,
              ),
              child: Center(
                  child: Text(
                Strings.of(context).title,
                style: MyTextStyle.style7,
              )),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: Text(Strings.of(context).history),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(Strings.of(context).settings),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.support),
              title: Text(Strings.of(context).support),
              onTap: () {},
            ),
          ],
        ),
      );
}
