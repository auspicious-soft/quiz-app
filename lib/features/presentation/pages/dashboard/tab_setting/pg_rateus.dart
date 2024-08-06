import 'dart:ffi';

import 'package:comptia/core/app_settings/constants/app_assets.dart';
import 'package:comptia/core/app_settings/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_settings/constants/app_dim.dart';
import '../../../widgets/label.dart';
import '../../../widgets/widget_global_margin.dart';
import '../../navigations/nav_cntrl.dart';


class PageRateUs extends StatefulWidget {
  const PageRateUs({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return StatePageRate();
  }

   
   
}

class StatePageRate extends State<PageRateUs>{
   double value = 3.5;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        height: double.infinity,
        color: AppColors.secondary,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(fit: BoxFit.cover, AppAssets.top_header),
                Positioned(
                  bottom: 20,
                  child: Container(
                    //   color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              // NavigationController.pushToInitial(
                              //     context, PageConst.dashBoard);
                              NavigationController.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        const Expanded(
                            // width: double.infinity,
                            child: Center(
                                child: Label(
                          txt: "Rate Us",
                          type: TextTypes.f_20_600,
                          forceColor: Colors.white,
                        ))),
                      ],
                    ),
                  ),
                ),
              ],
            )
        ,
        padVertical(50),
        rateCard(),
        padVertical(50),
        SizedBox(
          width: 200,
          child: ElevatedButton(onPressed: (){}, child: Text("Submit")))
          ],
        ),
      ),
    );
  }

  Widget rateCard() {
    return Padding(
      padding:   const EdgeInsets.only(left:20.0,right: 20.0,bottom: 50),
      child: Container(
       
     //  height:300.h ,
       width: double.infinity,
        decoration: const BoxDecoration(
        //   border: Border.all(width: 2,color: AppColors.black,
        
        // ), 
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black12, spreadRadius: 1)],
            
         color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
                
        ),
       child:    Center(child: 
       Column(children: [
        padVertical(30),
         Label(txt: "Rate US!", type: TextTypes.f_18_500,forceColor: Colors.black,),
            padVertical(10),
         Label(txt: "How would you love this app?", type: TextTypes.f_16_400,forceColor: Colors.black,),
         padVertical(10),
          RatingStars(
                value: value,
                onValueChanged: (v) {
                  //
                  setState(() {
                    value = v;
                  });
                },
                starBuilder: (index, color) => Icon(
                  Icons.star,
                  color: color,
                ),
                starCount: 5,
                starSize: 25,
                // valueLabelColor: AppColors.primary,
                // valueLabelTextStyle: const TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.w400,
                //     fontStyle: FontStyle.normal,
                //     fontSize: 12.0),
                // valueLabelRadius: 10,
                maxValue: 5,
                starSpacing: 2,
                maxValueVisibility: false,
                valueLabelVisibility: false,
                animationDuration: Duration(milliseconds: 1000),
                // valueLabelPadding:
                // const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
               // valueLabelMargin: const EdgeInsets.only(right: 8),
                starOffColor: const Color(0xffe7e8ea),
                starColor: AppColors.primary,
              ),
        
padVertical(20)

       ],)
      
       
       )),
    );
  }

}
