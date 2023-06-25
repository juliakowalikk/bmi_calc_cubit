import 'package:bmi_calc_cubit/pages/home_page/tiles/gender_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Gender { male, female }

class GenderPart extends StatefulWidget {
  const GenderPart({super.key});

  @override
  State<GenderPart> createState() => _GenderPartState();
}

class _GenderPartState extends State<GenderPart> {
  bool isMaleSelected = true;
  @override
  Widget build(BuildContext context) => Row(
        children: [
          GenderTile(
            title: Strings.of(context).male,
            icon: Icons.male,
            onPressed: () => changeTile(Gender.male),
            isClicked: isMaleSelected,
          ),
          GenderTile(
            title: Strings.of(context).female,
            icon: Icons.female,
            onPressed: () => changeTile(Gender.female),
            isClicked: !isMaleSelected,
          ),
        ],
      );

  void changeTile(Gender gender) => setState(() {
        if (gender == Gender.male) {
          isMaleSelected = true;
        } else if (gender == Gender.female) {
          isMaleSelected = false;
        }
      });
}
