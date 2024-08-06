import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/features/presentation/widgets/dot_colored.dart';
import 'package:comptia/features/presentation/widgets/label.dart';
import 'package:comptia/features/presentation/widgets/widget_global_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../core/app_settings/theme/app_colors.dart';
class Stats {
  final String title;
  final double value;

  Stats({required this.title, required this.value});
}
class TabStats extends StatelessWidget{
  const TabStats({super.key});


  @override
  Widget build(BuildContext context) {
    final List<Stats> data = [];
    var obj = Stats(title: "Readlines", value: 0.33);
    data.add(obj);
    obj = Stats(title: "Test Completed", value: 0.5);
     data.add(obj);
    obj = Stats(title: "Correct Answers", value: 0.70);
     data.add(obj);
   return  SafeArea(
     child:   WidgetGlobalMargin(
       child: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              const  Label(txt: "Stats", type: TextTypes.f_20_500),
         padVertical(20),
          currentPassRate(),
          padVertical(30),
           percentStatusView(context),
         padVertical(30),
               const Align(
          alignment:Alignment.centerLeft,
          child: Label(txt: "Quiz App", type: TextTypes.f_14_450)),
         padVertical(10),
          Container(height: 200,
          //color: Colors.white,
          width: double.infinity,
          decoration: const BoxDecoration(
          color: AppColors.white,
                  // border: Border.all(color: Colors.black,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)
          ),
           boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black12, spreadRadius: 1)],
          
                  )
                  ,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context , index) {
                      final info = data[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0,left: 15,right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [  Label(txt: info.title, type: TextTypes.f_14_450),   Label(txt: "${info.value}%", type: TextTypes.f_14_450),],)
                     , padVertical(10),
                       SizedBox(
                                   height: 3.h,
                                    child:   LinearProgressIndicator(
                                     backgroundColor: Colors.grey,
                                    // color: AppColors.white,
                                     valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary,),
                         value: info.value,
                                    ),
                                  )
                        ],),
                    );
                  }),
          )
         ],),
       ),
     ),
   );
  }

  Container percentStatusView(BuildContext context) {
    return Container(
      //  height: 300.h,
        decoration: BoxDecoration(
          color: AppColors.secondary,
         border: Border.all(color: Colors.black,width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)
          ),
           boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.black12, spreadRadius: 2)],
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [wheelData("Test Completed", context),wheelData("Correct Answers", context)],),
       );
  }

  Widget wheelData(String title, BuildContext context) {
    return Padding(
      padding:   const EdgeInsets.only(top:20.0,bottom: 20),
      child: Column(children: [Label(txt: title,
           type: TextTypes.f_16_500),
           padVertical(20),
           Container(
            color: Colors.transparent,
             child: CircularPercentIndicator(
                    radius: 60.0,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 13.0,
                    percent: 0.9,
                    center: Container(
                      decoration: const BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black12, spreadRadius: 2)],
  ),
                      child: const CircleAvatar(
                        radius: 40,
                        child: Center(
                          child: 
                          Label(txt: "5%", type: TextTypes.f_14_450)
                          ),
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: Colors.red,
                    progressColor: Colors.green,
                  ),
           )
      //          MultiCircularSlider(
      //     size: MediaQuery.of(context).size.width * 0.3,
      //     progressBarType: MultiCircularSliderType.circular,
      //     values: const [0.70],
      //     trackWidth: 15,
      //     trackColor: Colors.red,
      //     progressBarWidth: 10,
      //     colors: const [Color(0xFF18C737), ],
      //    label: "70%",
      //     // colors: [Color(0xFFFD1960), Color(0xFF29D3E8), Color(0xFF18C737), Color(0xFFFFCC05)],
      // labelTextStyle: TextStyle(color: Colors.black),
      // innerWidget: SizedBox(
      //   height: 100,
      //   child: Container(color: Colors.red,)),
      //     showTotalPercentage: true,
      // ),
            
        //        CircularProgressIndicator(
        //         strokeWidth: 5,
        //         //color: Colors.red,
        //         valueColor: AlwaysStoppedAnimation<Color>(Colors.blue,),
        // value: 0.70,
        //        )
           ],),
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
    children: [DotColored(dotColor: (index == 0) ? AppColors.dazzleBlue :  (index == 1) ? AppColors.lightSeaGreen : AppColors.primary),
    padHorizontal(3),
    Label(txt: "$percent%", type: TextTypes.f_24_700)
    ],)
  ],);

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
              children: [Label(txt: "Level 1",
           type: TextTypes.f_24_700,forceColor: Colors.white,),
           Label(txt: "33.33%", type: TextTypes.f_24_700,forceColor: Colors.white)
           ],),
           padVertical(10),
           SizedBox(
            height: 3.h,
             child: const LinearProgressIndicator(
              backgroundColor: Colors.grey,
             // color: AppColors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white,),
  value: 0.33,
             ),
           )
            ],),
        ) ,
      );
  }

  BoxDecoration decorateContainer([defaultRadius = 10.0]) {
 
    return BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(defaultRadius)));
  }
  
}
