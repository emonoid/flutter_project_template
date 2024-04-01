import 'package:flutter/material.dart';

import '../../theme/color.pallete.dart';

class CustomImagePicker extends StatefulWidget {
  CustomImagePicker(
      {required this.imageType,
      required this.onTap,
      required this.ImageFile,
      required this.onDelete,
      super.key,
      this.height,
      this.width,
      this.color,
      this.borderColor});

  final double? height;
  final double? width;
  final Color? color;
  final Color? borderColor;
  dynamic ImageFile;
  final imageType;
  final Function() onTap;
  final Function() onDelete;

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  dynamic authenticationProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // authenticationProvider = ref.watch(signInSignUpController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color ?? ColorPallete.whiteColor,
          border:
              Border.all(color: widget.borderColor ?? ColorPallete.whiteColor)),
      child: InkWell(
          onTap: widget.onTap,
          child: Container(
              decoration: BoxDecoration(
                  color: ColorPallete.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: widget.ImageFile == null
                  ? Image.asset('assets/images/splash_screen/Vector.png')
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          widget.ImageFile,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          right: -8,
                          top: -10,
                          child: IconButton(
                            icon: const Icon(
                              Icons.cancel_rounded,
                              color: Colors.red,
                            ),
                            onPressed: widget.onDelete,
                          ),
                        )
                      ],
                    ))),
    );
  }
}
