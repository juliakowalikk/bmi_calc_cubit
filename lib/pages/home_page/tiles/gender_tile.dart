import 'package:bmi_calc_cubit/style/colors.dart';
import 'package:bmi_calc_cubit/style/dimens.dart';
import 'package:flutter/material.dart';

class GenderTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function() onPressed;

  const GenderTile({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Dimens.xxl, horizontal: Dimens.s),
          child: Container(
            decoration: const BoxDecoration(color: navyBlue),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(Dimens.l),
                  child: InkWell(
                    onTap: onPressed,
                    child: Icon(
                      icon,
                      size: 80,
                      color: isSelected ? white : grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimens.xxl),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? white : grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
