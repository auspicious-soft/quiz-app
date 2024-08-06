import 'package:flutter/material.dart';

import '../../../core/app_settings/constants/app_const.dart';

class WidgetSubTitle extends StatelessWidget {
  const WidgetSubTitle({
    super.key,
    required this.txt
  });
final String txt;
  @override
  Widget build(BuildContext context) {
    return  Text(txt,
          style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: AppConst.fontFamily),);
  }
}