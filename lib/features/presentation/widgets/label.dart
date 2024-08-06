import 'package:comptia/core/app_settings/constants/app_const.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label(
      {super.key,
      required this.txt,
      required this.type,
      this.forceAlignment = TextAlign.start,
      this.scale,
      this.forceColor = Colors.black});
  final String txt;
  final TextTypes type;
  final Color forceColor;
  final TextAlign forceAlignment;
  final TextScaler? scale;
  @override
  Widget build(BuildContext context) {
    return Text(
      
      txt,
      //softWrap: true,
      textScaler:scale,
      textAlign: forceAlignment,
      style: fontStyle(),
    );
  }

  TextStyle fontStyle() {
    FontWeight weight = FontWeight.normal;
    double size = 11.0;
    switch (type) {
      case TextTypes.f_18_500:
        weight = FontWeight.w500;
        size = 18;
        break;
 case TextTypes.f_16_400:
        weight = FontWeight.w400;
        size = 16;
        break;
      case TextTypes.f_24_700:
        weight = FontWeight.w700;
        size = 24;
        break;
      case TextTypes.f_14_450:
        weight = FontWeight.w400;
        size = 14;
        break;
        case TextTypes.f_14_500:
        weight = FontWeight.w500;
        size = 14;
        break;
        case TextTypes.f_12_400:
        weight = FontWeight.w400;
        size = 12;
        break;
      case TextTypes.f_18_700:
        weight = FontWeight.w700;
        size = 18;
        break;
        case TextTypes.f_20_400:
        weight = FontWeight.w400;
        size = 20;
        break;
        case TextTypes.f_20_500:
        weight = FontWeight.w700;
        size = 20;
        case TextTypes.f_20_600:
        weight = FontWeight.w600;
        size = 20;
        break;
         case TextTypes.f_16_500:
        weight = FontWeight.w500;
        size = 16;
        break;
    }
    
    return TextStyle(
      
        color: forceColor,
        fontFamily: AppConst.fontFamily,
        fontWeight: weight,
        fontSize: size);
  }
}

enum TextTypes { f_18_500, f_24_700, f_14_450, f_18_700, f_20_400, f_20_500, f_16_500, f_12_400, f_20_600, f_14_500, f_16_400 }
