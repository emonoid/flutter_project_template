import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../theme/color.pallete.dart';
import '../../utils/app_space.dart';
import 'qtec_button.dart';
import 'qtec_text.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 200,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Lottie.asset(
              'assets/animations/no-internet.json',
              fit: BoxFit.fill,
            ),
          ),
          AppSpace.spaceH10,
          const QtecTextWidget(
            text: "No internet!",
            fontWeight: FontWeight.bold,
            color: ColorPallete.redColor,
            fontSize: 20,
          ),
          AppSpace.spaceH10,
          QtecButton(
              onTap: () {},
              buttonHeight: 40,
              buttonWidth: 110,
              buttonText: "Try Again",
              isLoading: false,
              borderColor: ColorPallete.blackColor,
              buttonColor: ColorPallete.whiteColor,
              showIcon: false),
        ],
      ),
    );
  }
}
