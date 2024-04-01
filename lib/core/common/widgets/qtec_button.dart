import 'package:flutter/material.dart';

import '../../theme/color.pallete.dart';
import 'qtec_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onTap,
    this.borderRadius,
    required this.buttonColor,
    required this.textColor,
    this.borderColor,
    this.bottonwidth,
    this.fontSize,
    this.fontWeight,
    required this.buttonText,
    this.textDecoration,
    Key? key,
    this.gradient,
  }) : super(key: key);

  final VoidCallback onTap;
  final Color? buttonColor;
  final double? borderRadius;
  final Color? textColor;
  final String buttonText;
  final Color? borderColor;
  final double? bottonwidth;
  final Gradient? gradient;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.00,
      width: bottonwidth,
      margin: const EdgeInsets.only(left: 5.00, right: 5.00),
      decoration: BoxDecoration(
          color: buttonColor ?? Colors.white,
          gradient: gradient,
          border: Border.all(color: borderColor ?? Colors.white),
          borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: QtecTextWidget(
                text: buttonText,
                color: textColor,
                fontSize: fontSize ?? 16.0,
                fontWeight: fontWeight ?? FontWeight.w500,
                textDecoration: textDecoration,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QtecButton extends StatelessWidget {
  const QtecButton({
    required this.onTap,
    this.borderRadius,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    this.buttonWidth,
    this.fontSize,
    this.fontWeight,
    required this.buttonText,
    this.buttonHeight,
    this.gradient,
    required this.isLoading,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.textDecoration,
    this.boxShadow,
    required this.showIcon,
    Key? key,
  }) : super(key: key);
  final VoidCallback? onTap;
  final Color? buttonColor;
  final double? borderRadius;
  final Color? textColor;
  final String buttonText;
  final Color? borderColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Gradient? gradient;
  final bool isLoading;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final TextDecoration? textDecoration;
  final List<BoxShadow>? boxShadow;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight ?? 50,
      width: buttonWidth ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: boxShadow,
          // gradient: onTap != null ? gradient : null,

          color: onTap != null
              ? buttonColor ?? ColorPallete.greenColor
              : Colors.grey.withOpacity(0.5),
          border: Border.all(color: borderColor ?? Colors.white),
          borderRadius: BorderRadius.circular(borderRadius ?? 15)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: !isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 10,
                          fit: FlexFit.loose,
                          child: Align(
                            alignment: Alignment.center,
                            child: QtecTextWidget(
                              text: buttonText,
                              color: textColor,
                              fontSize: fontSize ?? 16.0,
                              fontWeight: fontWeight ?? FontWeight.w400,
                              textDecoration: textDecoration,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: icon != null
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    icon,
                                    size: iconSize ?? 16,
                                    color: iconColor ?? ColorPallete.whiteColor,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(
                      color: ColorPallete.whiteColor,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
