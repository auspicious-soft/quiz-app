import 'package:flutter/material.dart'; 

extension TextBox on String {
  TextStyle customStyle(TextType size) {
    switch (size) {
      case TextType.largeTitle:
        return const TextStyle(fontSize: 22, fontWeight: FontWeight.w600);

      case TextType.microTextTitle:
        return const TextStyle(fontSize: 17, fontWeight: FontWeight.w600);

      case TextType.microTextSubTitle:
        return const TextStyle(fontSize: 13, fontWeight: FontWeight.w300);
      case TextType.microAction:
        return const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
      case TextType.dialogTitle:
        return const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
    }
  }

  Widget withTextBox({required TextType ofType, bool center = false}) {
    return Text(
      this,
      textAlign: (center) ? TextAlign.center : TextAlign.left,
      style: customStyle(ofType),
    );
  }
}

enum TextType {
  largeTitle,
  microTextTitle,
  microTextSubTitle,
  microAction,
  dialogTitle
}