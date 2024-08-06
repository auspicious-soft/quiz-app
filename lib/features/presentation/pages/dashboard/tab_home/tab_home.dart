import 'package:comptia/core/app_settings/constants/app_assets.dart';
import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/core/app_settings/constants/set_strings.dart';
import 'package:comptia/features/presentation/cubits/quiz_timer/cubit_quiz_timer.dart';
import 'package:comptia/features/presentation/pages/navigations/nav_cntrl.dart';
import 'package:comptia/features/presentation/pages/navigations/pg_const.dart';
 import 'package:comptia/features/presentation/widgets/label.dart';
import 'package:comptia/features/presentation/widgets/widget_global_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_settings/theme/app_colors.dart';

class TabHome extends StatelessWidget{
  const TabHome({super.key});

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: WidgetGlobalMargin(
      // padding: const EdgeInsets.all(8.0),
       child: Column(children: [
        padVertical(30),
       Container(
         height: 65,
         width: 65,
         decoration: BoxDecoration(border: Border.all(width: 1,color: AppColors.primary,
        
         ), 
         // borderRadius: const BorderRadius.all(Radius.circular(20)),
                
         ),
         child: Image.asset(AppAssets.logo),)
       ,
       padVertical(40),
       InkWell(
        onTap: () {
          BlocProvider.of<CubitQuizTimer>(context).resetState();
          NavigationController.navigateTo(context, PageConst.quizPanel);
        },
        child: btnBox())
    ,
    padVertical(20),
    InkWell(
        onTap: () {
        //  BlocProvider.of<CubitQuizTimer>(context).resetState();
          NavigationController.navigateTo(context, PageConst.categoryList);
        },
        child:     customButtom(AppAssets.category))
 
     ,padVertical(20),
      customButtom(AppAssets.timer_black),
     
       ],),
     ),
   );
  }

  Container customButtom(String img) {
    return Container(
     // 
     height:80 ,
     width: double.infinity,
      decoration: BoxDecoration(border: Border.all(width: 1,color: AppColors.black,
      
       ), 
      color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
              
       ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [Image.asset(img),
     padHorizontal(20),
     const Label(txt: SetString.Category_Questions, type: TextTypes.f_20_400,)
     ],),
     
     );
  }

  Container btnBox() {
    return Container(
     // 
     height:80.h ,
     width: double.infinity,
      decoration: BoxDecoration(border: Border.all(width: 1,color: AppColors.primary,
      
       ), 
       color: AppColors.primary,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
              
       ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [Image.asset(AppAssets.random),
     padHorizontal(20),
     const Label(txt: SetString.TwentyRandom, type: TextTypes.f_20_400,forceColor: Colors.white,)
     ],),
     
     );
  }
  
}