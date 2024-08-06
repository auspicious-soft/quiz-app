import 'package:comptia/core/app_settings/constants/set_strings.dart';
import 'package:comptia/features/presentation/cubits/quiz_timer/cubit_quiz_timer.dart';
import 'package:comptia/features/presentation/pages/navigations/nav_cntrl.dart';
import 'package:comptia/features/presentation/pages/navigations/pg_const.dart';
import 'package:comptia/features/presentation/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_settings/constants/app_assets.dart';
import '../../../../../core/app_settings/constants/app_dim.dart';
import '../../../../../core/app_settings/theme/app_colors.dart';
import '../../../widgets/widget_global_margin.dart';

class PageCategoryList extends StatelessWidget {
  const PageCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
             child: WidgetGlobalMargin(
        // padding: const EdgeInsets.all(8.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          padVertical(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                IconButton(
                            onPressed: () {
                              // NavigationController.pushToInitial(
                              //     context, PageConst.dashBoard);
                              NavigationController.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back,color: Colors.black,)),
          
           
          const Label(txt: "20 Category Questions", type: TextTypes.f_20_600),
       IconButton(
                            onPressed: () {
                              // NavigationController.pushToInitial(
                              //     context, PageConst.dashBoard);
                            },
                            icon: const Icon(Icons.cancel))
          ],
        
          ),
        
         padVertical(40),
         InkWell(
          onTap: () {
             BlocProvider.of<CubitQuizTimer>(context).resetState();
          NavigationController.navigateTo(context, PageConst.quizPanel);
          },
          child:   cardContainer())
            ,
            padVertical(20),

            cardContainerTwo("Category 2"),
               padVertical(10),

            cardContainerTwo("Category 3"),
               padVertical(10),

            cardContainerTwo("Category 4")
            
            //  customButtom(AppAssets.timer_black),
             
         ],),
             ),
           ),
      );
  }
  
   Container cardContainer() {
    return Container(
     // 
     height:80.h ,
     width: double.infinity,
      decoration: BoxDecoration(border: Border.all(width: 1,color: AppColors.primary,
      
       ), 
       color: AppColors.primary,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
              
       ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
       const Label(txt: "Category 1", type: TextTypes.f_20_400,forceColor: Colors.white,)
    ,
     padVertical(10),
     Padding(
       padding: const EdgeInsets.only(left: 10.0,right: 10.0),
       child: widgetProgressIndicator(0.5),
     )
     ],),
     
     );
  }
   
    LinearProgressIndicator widgetProgressIndicator(double prog) {
    return LinearProgressIndicator(
      color: Colors.red,
                value: prog,
                valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.white),
                backgroundColor: Colors.white30,
              );
  }

  Container cardContainerTwo(String title) {
    return Container(
     // 
     height:80.h ,
     width: double.infinity,
      decoration: BoxDecoration(border: Border.all(width: 2,color: AppColors.black,
      
       ), 
       color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
              
       ),
     child:  Center(child: Label(txt: title, type: TextTypes.f_20_400,forceColor: Colors.black,))
      
     
     );
  }
   

}