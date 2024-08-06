import 'package:comptia/core/app_settings/constants/app_const.dart';
import 'package:flutter/material.dart';

class TextTitleMedium extends StatelessWidget {
  const TextTitleMedium({super.key,required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style: const TextStyle(fontSize: 14,fontFamily: AppConst.fontFamily
    , fontWeight: FontWeight.w500),);
  }
  
}