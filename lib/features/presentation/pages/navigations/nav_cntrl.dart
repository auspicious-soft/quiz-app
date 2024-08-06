import 'package:flutter/material.dart';
 

class NavigationController {
  NavigationController._();
  static void navigateTo(BuildContext context, String destinationName,
      [Object? anyArguments]) {
    //onConsole('Received argument $anyArguments');
    // Get.toNamed(destinationName, arguments: anyArguments);
    // Navigator.pushNamedAndRemoveUntil(
    //     context, destinationName, (Route<dynamic> route) => false);
    Navigator.pushNamed(context, destinationName, arguments: anyArguments);

  //  Navigator.push(context, MaterialPageRoute(builder: (context)=> const ))
  }

  static void pushToInitial(BuildContext context, String destinationName,
      [dynamic anyArguments]) { 
    Navigator.pushNamedAndRemoveUntil(
        context, destinationName, (Route<dynamic> route) => false);

        ///
//         Navigator.pushNamedAndRemoveUntil(
// context,
// PageRouteBuilder(
// pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
// transitionsBuilder: (context, animation, secondaryAnimation, child) {
// var begin = Offset(1.0, 0.0);
// var end = Offset.zero;
// var curve = Curves.ease;
// var tween = Tween(begin: begin, end: end)
// .chain(CurveTween(curve: curve));
// return SlideTransition(
// position: animation.drive(tween),
// child: child,
// );
//       }));
        ///
  }

   
  void navigateBack(BuildContext context, [dynamic anyReturnData]) {
     
    Navigator.pop(context);
  }

  static void pop(BuildContext context,) {
    Navigator.pop(context);
  }

 
}