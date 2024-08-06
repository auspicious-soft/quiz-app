import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/features/presentation/widgets/cards/card_option.dart';
import 'package:comptia/features/presentation/widgets/cards/card_result_reveal.dart';
import 'package:flutter/material.dart';

import '../../../widgets/cards/card_result.dart';

class TabInCorrect extends StatelessWidget {
  const TabInCorrect({super.key});
 
  @override
  Widget build(BuildContext context) {
   return ListView.builder(
    itemCount: 5,
    itemBuilder: (context , index){
    return const Padding(
      padding:  EdgeInsets.only(top:15.0),
      child: Column(
        children: [
             CardResult(
          color: Color(0xFFFFE1DB),
          title: "Which of the following is considered an emotional symptom of trauma?"),
         // padVertical(10),
       //   CardResultReveal(result: index%2 == 0 ? ResultType.correct : ResultType.incorrect, )
        ],
      ),
    );
   });
  }

   
  
}