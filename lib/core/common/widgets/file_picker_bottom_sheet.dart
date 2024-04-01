import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../theme/color.pallete.dart';
import 'qtec_text.dart';

class FilePicker extends StatelessWidget {
  File? file;

  FilePicker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: const QtecTextWidget(
              text: 'Select option',
              //style: bb_text_style_24_bold_black,

              fontSize: 22, color: ColorPallete.primaryTextColor,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _bottomSheetOptions(
                  context: context,
                  label: 'Camera',
                  icon: Icons.camera,
                  onClicked: () => _selectedItem(context, 0),
                ),
                const SizedBox(width: 20),
                _bottomSheetOptions(
                  context: context,
                  label: 'Gallery',
                  icon: Icons.image,
                  onClicked: () => _selectedItem(context, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _selectedItem(BuildContext context, int index) async {
    switch (index) {
      case 0:
        await _openCamera(context);
        if (context.mounted) {
          Navigator.pop(context, file);
        }

        break;
      case 1:
        await _openGallery(context);

        if (context.mounted) {
          Navigator.pop(context, file);
        }

        break;
    }
  }

  _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
        maxHeight: 1024,
        maxWidth: 1024);

    if (pickedFile != null) {
      file = File(pickedFile.path);
      return file;
    } else {
      return null;
    }
  }

  _openCamera(BuildContext context) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 25,
        maxHeight: 1024,
        maxWidth: 1024,
        preferredCameraDevice: CameraDevice.rear);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      return file;
    } else {
      return null;
    }
  }
}

Widget _bottomSheetOptions({
  required BuildContext context,
  required String? label,
  required IconData? icon,
  VoidCallback? onClicked,
}) {
  return SizedBox(
    width: 120,
    height: 120,
    child: GestureDetector(
      onTap: onClicked,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: ColorPallete.primaryColor,
            size: 30,
            // width: 50,
            // height: 50,
          ),
          QtecTextWidget(
            text: label!,
          ),
        ],
      ),
    ),
  );
}
