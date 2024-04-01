import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../theme/color.pallete.dart';
import '../../utils/app_space.dart';
import 'qtec_text.dart';
import 'sneak_bar.dart';

class QtecDatePicker extends StatelessWidget {
  const QtecDatePicker({
    super.key,
    required this.onTap,
    required this.selectedDateTime,
  });

  final Function(DateTime) onTap;
  final DateTime selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2023),
            lastDate: DateTime(2050));
        if (pickedDate != null) {
          onTap(pickedDate);
        } else {
          if (context.mounted) {
            QtecSneakBar.customSnackBar(
              context: context,
              snackText: "Please select data.",
            );
          }
        }
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorPallete.scaffoldBackGroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QtecTextWidget(
              text: DateFormat('dd-MMM-yyy').format(selectedDateTime),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            AppSpace.spaceW6,
            const Icon(
              Icons.calendar_month,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
