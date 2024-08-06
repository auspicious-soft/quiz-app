import 'package:comptia/core/app_settings/constants/app_const.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../button_themes.dart';

ThemeData myLightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.secondary,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontFamily: AppConst.fontFamily,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22)),
    colorScheme: const ColorScheme.light(
        background: AppColors.white,
        primary: AppColors.secondary,
        secondary: Color(0xFF7E7F91), //#7E7F91
        onPrimary: AppColors.primary,
        primaryContainer: AppColors.white),
    elevatedButtonTheme: elevatedBtnTheme,
    iconTheme: const IconThemeData(color: AppColors.primary)
    //textTheme: TextTheme(s)
    // inputDecorationTheme: fieldLightTheme,
    );
