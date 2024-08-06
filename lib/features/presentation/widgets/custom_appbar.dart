import 'package:flutter/material.dart';

import '../../../core/app_settings/constants/app_const.dart';

AppBar customAppBar({required String title}) {
  
  return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(title,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: AppConst.fontFamily),),
    );
  
}