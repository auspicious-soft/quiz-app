import 'package:comptia/core/app_settings/constants/app_const.dart';
import 'package:comptia/features/presentation/widgets/label.dart'; 
import 'package:flutter/material.dart';

class Styles {
  Styles._();
static TextStyle getTxtStyle({required TextTypes key} ){
 
  FontWeight weight = FontWeight.normal;
    double size = 11.0;
    switch (key) {
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
        break;
         case TextTypes.f_16_500:
        weight = FontWeight.w500;
        size = 16;
        break;
      case TextTypes.f_12_400:
        // TODO: Handle this case.
      case TextTypes.f_20_600:
        // TODO: Handle this case.
      case TextTypes.f_14_500:
        // TODO: Handle this case.
    }
    
  return TextStyle(fontSize: size,fontFamily: AppConst.fontFamily,fontWeight: weight);
}

 
}
