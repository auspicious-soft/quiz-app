import 'dart:ffi';

import 'package:comptia/core/app_settings/constants/app_assets.dart';
import 'package:comptia/core/app_settings/theme/app_colors.dart';
import 'package:comptia/features/presentation/widgets/explanation_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_settings/constants/app_dim.dart';
import '../../../widgets/label.dart';
import '../../../widgets/widget_global_margin.dart';
import '../../navigations/nav_cntrl.dart';


class PageContactUs extends StatefulWidget {
  const PageContactUs({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return StatePPageContactUs();
  }

   
   
}

class StatePPageContactUs extends State<PageContactUs>{
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
                Image.asset(fit: BoxFit.cover, AppAssets.top_header_b),

                  Positioned(
                  top: 80,
                  child: IconButton(
                                onPressed: () {
                                  // NavigationController.pushToInitial(
                                  //     context, PageConst.dashBoard);
                                  NavigationController.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                  ),
                  const Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child:  Center(
                    child: Label(
                                                                txt: "Contact Us",
                                                                type: TextTypes.f_20_600,
                                                                forceColor: Colors.white,
                                                              ),
                  )),
                Positioned(
                  bottom: 20,
                   left: 0,
                  right: 0,
                  child: Center(child: Image.asset(AppAssets.logo,height: 155,width: 155,)),
                  
                 ),
              ],
            )
        ,
        padVertical(50),
        fieldView("Full Name"),
      
        fieldView("Email Address"),
        Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20),
          child: ExplanationBoxB(hintTxt: "Message"),
        ),
        padVertical(50),
        SizedBox(
          width: 200,
          child: ElevatedButton(onPressed: (){}, child: const Text("Submit")))
          ],
        ),
      ),
    );
  }

   
  Widget fieldView(String title){
    return  Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 10),
      child: SizedBox(
                              width: double.infinity,
                              height: 45.h,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black12, spreadRadius: 1)],
            
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    ),
                                child:   Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                                    textInputAction: TextInputAction.done,
      
                                   // maxLines: maxLines, //or null
                                    decoration: InputDecoration.collapsed(
                                        hintText: title),
                                  ),
                                ),
                              )),
    );
  
  }

}


 
class ExplanationBoxB extends StatelessWidget {


  const ExplanationBoxB({
    super.key,
    required this.hintTxt,
    this.maxLines = 8
  });

final int maxLines;
final String hintTxt;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                            width: double.infinity,
                            height: (maxLines > 8) ? 200.h : 100.h,
                            child: Container(
                              decoration: BoxDecoration(
                                 boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black12, spreadRadius: 1)],
            
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                   ),
                              child:   Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                                  textInputAction: TextInputAction.done,
    
                                  maxLines: maxLines, //or null
                                  decoration: InputDecoration.collapsed(
                                      hintText: hintTxt),
                                ),
                              ),
                            ));
  
  }
}