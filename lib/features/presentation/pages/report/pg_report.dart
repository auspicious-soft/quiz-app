import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/features/presentation/pages/navigations/nav_cntrl.dart';
import 'package:comptia/features/presentation/pages/navigations/pg_const.dart';
import 'package:comptia/features/presentation/widgets/explanation_box.dart';
import 'package:comptia/features/presentation/widgets/widget_global_margin.dart';
import 'package:flutter/material.dart';

import '../../widgets/cards/card_option.dart';
import '../../widgets/label.dart'; 

class PgReport extends StatelessWidget{
   const  PgReport({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.width * 0.2;
   return   Scaffold(appBar:   widgetAppBar(title: "Report Question",),
   body:   WidgetGlobalMargin(
   
     child: Column(children: [
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context , index ){
        return   Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CardOption(resultType: ResultType.neutral, optionType: OptionType.radio, isSelected: (index == 1) ?  true :  false, opton: "Wrong Answer", pos: OptionPostion.left,),
        );
      
      }),
padVertical(50),
      const ExplanationBox(maxLines: 20, hintTxt: "Please describe the issue, using at least 50 characters.",),
      padVertical(10),
      const Label(txt: "It should have at least 50 words but no more than 255 words.", type: TextTypes.f_14_450)
    ,const Spacer(),
    Padding(
      padding:   EdgeInsets.only(left:deviceSize,right:deviceSize),
      child: ElevatedButton(onPressed: (){
        NavigationController.navigateTo(context, PageConst.pgQuesAccordion);
      }, child: const Text("Report")),
    ),
    padVertical(30)
       ],),
   ),
   );
  }
  
}


AppBar widgetAppBar({required String title}) {
   
  return AppBar(
    backgroundColor: Colors.transparent,
    title:   Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),);
  
}