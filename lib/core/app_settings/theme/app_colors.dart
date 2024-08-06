import 'package:flutter/material.dart';
 
class AppColors {
 

  static const microText = Color(0xFF615F77);

  static const emailLabel = Color(0xFF303030);

  static const fieldBG = Color(0xFFF4F4F4);

  static const dazzleBlue    = Color.fromRGBO(2, 81, 102, 1);
  static const lightSeaGreen    = Color.fromRGBO(0, 164, 173, 1);

  static const secondaryDark = Color(0xEEE4D1BB);
//#8FD14F
  static const  correct  = Color(0xFF8fd14f);

  static const incorrect = Color(0xFFF24726);
  AppColors._();
  //rgba(229, 34, 58, 1)
  static const Color primary =    Color.fromRGBO( 246, 114, 0, 1);
     /// Color(0xFFE67A00); //E5223A ##E67A00 background: #E5223A;
  static const Color secondary = Color(0xFFFFF7ED); //#151627
  static const Color pageBg = Color(0xFFF5F6FA); //9F9D9D F3F2F9 #D9D9D9
  static const Color tableOddRow = Color(0xFFF6E6E6);
  static const Color subtitle = Color(0xff35414B);
  static const Color red = Color(0xFFE5223A);
  static const Color sky = Color(0xffdeebf9); //7534ff//

  static const Color bottom = Color(0xff0e2d94); //7534ff//
  static const Color lightPurple = Color(0xFFc3c3e5);
  static const Color purple = Color(0xFF443266);
  static const Color purpleShade200 = Color(0xFFf1f0ff);
  static const Color purpleShade500 = Color(0xFF8080ad);
  static const Color purpleShade900 = Color(0xFF191b25);
  static const Color purpleMid = Color(0xFF8c489f);
  static const Color purpleLight = Color(0xff9900ff);
  static const Color black = Color(0xff0c0c0c);
  static const Color white = Color(0xFFffffff);
  static const Color blue = Color(0xFF1478f2);
  static const Color blueLight = Color(0xFf2b78e4); //0xFF1478F2

  static const Color redDark = Color(0xFFCC0000);
  static const Color grey = Color(0xff837e7e);
  static const Color grey1 = Color(0xffd9d6d6);
  // static const Color table_line_even = Color(0xFFeeeeee);

  static const Color starUnSelected = Color(0xFF8080ad);
  static const Color starSelected = Color(0xFFfac917);
  static const Color green = Color(0xFF00ac00);
  static const Color hint = Color(0xFF464646);

  static const Color gray = Color(0xFF5d5d5d);
  static const Color border = Color(0xFFffffff);
  static const Color grayBackground = Color(0xFFf2f2f2);
  static const Color yellow = Color(0xFFFBD651);
  static const Color yellowBrown = Color(0xFF9B8227);
  static const Color baseBG = Color(0xFFb3e2bb);
  static const fieldColor = Color(0xFF35414B);
  static const blackDim = Color(0xFF555555);
  static const gradient = LinearGradient(colors: [
    Color.fromRGBO(2, 2, 2, 1.0),
    Color.fromRGBO(112, 112, 112, 1.0)
  ]);

  static const start = Color(0xFFA40404);

  static const end = Color(0xFF49649C);

  static const highLighterBg = Color(0xFFFFFAFA);
  static const highLighterBgTypeB = Color(0xFFFFF3F3); //FFF3F3
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
