// import 'package:flutter/material.dart';
 
// import '../../../core/app_settings/theme/app_colors.dart';
 

// class AppThemesChooser{
//   static ThemeData lightTheme( BuildContext context){
// return ThemeData(
//   brightness: Brightness.light,
//     colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
//     useMaterial3: true
//     ,
    
//    // scaffoldBackgroundColor: AppColors.primary,
//           primarySwatch: buildMaterialColor(AppColors.black),
//           textTheme: Theme.of(context).textTheme.apply(
//                 fontFamily: "Duplet",
//                 bodyColor: Colors.black87,
//               ),
//           inputDecorationTheme: InputDecorationTheme(
//             contentPadding: const EdgeInsets.symmetric(horizontal: 40),
//             hintStyle: const TextStyle(
//               color: Colors.black54,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//               borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
//             ),
//             errorStyle: const TextStyle(fontSize: 14),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide: const BorderSide(
//                 color: AppColors.red,
//                 width: 1,
//                 style: BorderStyle.solid,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//               borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
//             ),
//           ),
//           elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ElevatedButton.styleFrom(
//   backgroundColor: AppColors.primary, //button's fill color
//     foregroundColor: AppColors.white, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
//    // onSurface: Colors.orange, //specify the button's disabled text, icon, and fill color
//     shadowColor: Colors.white, //specify the button's elevation color
//    // elevation: 4.0, //buttons Material shadow
//     textStyle: const TextStyle(fontFamily: 'Duplet',fontSize: 14,
//     fontWeight: FontWeight.w500
//     ), //specify the button's text TextStyle
//     //padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0), //specify the button's Padding
//     minimumSize: const Size(double.infinity, 48), //specify the button's first: width and second: height
//    // side: BorderSide(color: Colors.yellow, width: 2.0, style: BorderStyle.solid), //set border for the button
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)), // set the buttons shape. Make its birders rounded etc
//     enabledMouseCursor: MouseCursor.defer, //used to construct ButtonStyle.mouseCursor
//     disabledMouseCursor: MouseCursor.uncontrolled, //used to construct ButtonStyle.mouseCursor
//    // visualDensity: const VisualDensity(horizontal: 0.0, vertical: 0.0), //set the button's visual density
//     tapTargetSize: MaterialTapTargetSize.padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
//     animationDuration: const Duration(milliseconds: 100), //the buttons animations duration
//     enableFeedback: true, //to set the feedback to true or false
//     alignment: Alignment.center, //set the button's child Alignment
//   ),
              
            
            
//             // ButtonStyle(
//             //   textStyle: MaterialStateProperty.all<TextStyle>(
//             //     const TextStyle(
//             //       fontSize: 13,
//             //       fontWeight: FontWeight.w500,
//             //       color: Colors.white,
//             //     ),
//             //   ),
//             //   minimumSize: MaterialStateProperty.all<Size>(
//             //     const Size(double.infinity, 45),
//             //   ),
//             //   maximumSize: MaterialStateProperty.all<Size>(
//             //     const Size(double.infinity, 48),
//             //   ),
//             //   foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//             //   backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
//             //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             //     RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.circular(8.0),
//             //       side: const BorderSide(color: AppColors.primary),
//             //     ),
//             //   ),
//             // ),
//           ),
      
//   );
//   }
 
//    static darkTheme( BuildContext context){
// return ThemeData(

// //brightness: Brightness.light,
//   colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondary, 
//               brightness: Brightness.dark),
//    // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondary),
//     useMaterial3: true
//     ,
//      scaffoldBackgroundColor: AppColors.secondary,
//           primarySwatch: buildMaterialColor(AppColors.black),
//           textTheme: Theme.of(context).textTheme.apply(
//                 fontFamily: "Duplet",
//                 bodyColor: Colors.white,
//               ),
//           inputDecorationTheme: InputDecorationTheme(
//             contentPadding: const EdgeInsets.symmetric(horizontal: 40),
//             hintStyle: const TextStyle(
//               color: Colors.black54,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//               borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
//             ),
//             errorStyle: const TextStyle(fontSize: 14),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide: const BorderSide(
//                 color: AppColors.red,
//                 width: 1,
//                 style: BorderStyle.solid,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//               borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
//             ),
//           ),
//           elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ButtonStyle(
//               textStyle: MaterialStateProperty.all<TextStyle>(
//                 const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//               minimumSize: MaterialStateProperty.all<Size>(
//                 const Size(double.infinity, 45),
//               ),
//               maximumSize: MaterialStateProperty.all<Size>(
//                 const Size(double.infinity, 50),
//               ),
//               foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//               backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   side: const BorderSide(color: Colors.red),
//                 ),
//               ),
//             ),
//           ),
      
//   );
//   }
// }