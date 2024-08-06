import 'package:flutter/material.dart';

import '../../../core/app_settings/constants/app_const.dart';

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({
    super.key,
    required this.txt
  });
final String txt;
  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.only(top: 30)
    ,
    child: Center(
      child: Text(txt,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: AppConst.fontFamily),),
    ),
    );
  }
}