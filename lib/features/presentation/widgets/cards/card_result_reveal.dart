
import 'package:flutter/material.dart';

import 'card_option.dart';

class CardResultReveal extends StatelessWidget {
  const CardResultReveal({
    super.key, 
    required this.result
  });
 
final ResultType result;
  @override
  Widget build(BuildContext context) {
     const padSide = 10.0;
    return Container(
      //height: 200,
    decoration: BoxDecoration(border: Border.all(
      width: 1,
      color: Colors.black
      
    ),
    color: Colors.white,
    borderRadius: BorderRadius.circular(10)
    ),
    child: Padding(
      padding:   const EdgeInsets.only(left: padSide,right: padSide,bottom: 20,top: 20),
      child:   CardOption(
        keepBorderOneColor: true,
        resultType: result, optionType: OptionType.checkMark, opton: "Option 11111 opition 1",
      contentPad: 20,
       pos: OptionPostion.right, isSelected: true),
    ),
    );
  }
}