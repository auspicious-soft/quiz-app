import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/features/presentation/widgets/label.dart';
import 'package:comptia/features/presentation/widgets/widget_global_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_settings/theme/app_colors.dart';

class TabStatssec extends StatelessWidget{
  const TabStatssec({super.key});

  @override
  Widget build(BuildContext context) {
   return  SafeArea(
     child:   WidgetGlobalMargin(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
     const  Label(txt: "Stats", type: TextTypes.f_24_700),
       padVertical(20),
        currentPassRate(),
        padVertical(30),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dataInPercent("Tests taken","0",0),
          dataInPercent("Correct answers","0",1),
          dataInPercent("Questions taken","0",2)],)
         
       ],),
     ),
   );
  }

  Column dataInPercent(String title, String percent, int index) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Label(forceAlignment: TextAlign.center, scale: const TextScaler.linear(0.9), txt: title, type: TextTypes.f_18_700,),
  Row(
   // m: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [dot(index),
    padHorizontal(3),
    Label(txt: "$percent%", type: TextTypes.f_24_700)
    ],)
  ],);

  ClipRRect dot(int index) {
    return ClipRRect(
  borderRadius: BorderRadius.circular(4),
  child: Container(height: 8,width: 8,color: (index == 0) ? AppColors.dazzleBlue :  (index == 1) ? AppColors.lightSeaGreen : AppColors.primary));
  }

  Container currentPassRate() {
    return Container(
        width: double.infinity,
        //height: 70.h,
        decoration: decorateContainer(),
        child:  Padding(
          padding: const EdgeInsets.only(top:20.0,bottom: 20,left: 10,right: 10),
          child: Column(children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Label(txt: "Current pass rate",
           type: TextTypes.f_18_700,forceColor: Colors.white,),
           Label(txt: "0%", type: TextTypes.f_18_700,forceColor: Colors.white)
           ],),
           padVertical(10),
           SizedBox(
            height: 2.h,
             child: const LinearProgressIndicator(
              backgroundColor: Colors.grey,
             // color: AppColors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white,),
  value: 0.5,
             ),
           )
            ],),
        ) ,
      );
  }

  BoxDecoration decorateContainer([defaultRadius = 20.0]) {
 
    return BoxDecoration(
          color: AppColors.dazzleBlue,
          borderRadius: BorderRadius.all(Radius.circular(defaultRadius)));
  }
  
}