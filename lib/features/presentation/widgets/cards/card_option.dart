
import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/features/presentation/widgets/label.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_settings/theme/app_colors.dart';
import '../empty_view.dart'; 
enum OptionPostion{
  left , right 
}
enum OptionType{
  radio , checkMark 
}
enum ResultType{
  correct , incorrect, neutral
}
class CardOption extends StatelessWidget {
  const CardOption({
    super.key,
    required this.opton,
    required this.pos,
    required this.optionType,
    required this.isSelected,
    required this.resultType,
    this.contentPad = 10.0,
    this.keepBorderOneColor = false 
  });
  final bool keepBorderOneColor;
  final ResultType resultType;
  final double contentPad;
  final String  opton;
  final OptionType optionType;
final OptionPostion pos;
final bool isSelected;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      // height:50.h ,
      decoration:  resultType == ResultType.correct ? 
      correctOptionDecoration() :
       resultType == ResultType.incorrect ? 
       inCorrectOptionDecoration() :
        neutralOptionDecoration(),   
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:   EdgeInsets.all(contentPad),
            child: Row(
              children: [
                (pos == OptionPostion.left) ?     Padding(
                  padding: const EdgeInsets.only(right:5),
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Radio<int>(
                          activeColor: AppColors.primary,
                          value: 1,
                          groupValue: 1,
                          onChanged: (value) {
                            //  setState(() {
                            //   selectedOption = value;
                            //   print("Button value: $value");
                            //   });
                          })),
                ):emptyView(), 
                  Expanded(
                    child: Label(
                        txt:
                            opton,
                        type: TextTypes.f_14_500,forceColor: resultType == ResultType.incorrect ? Colors.white : Colors.black)),
                
                 (pos == OptionPostion.right) ?  
                 setRightOption():const EmptyView()
               
              ],
            ),
          )),
    );
  }

  BoxDecoration correctOptionDecoration() {
    return BoxDecoration(
      color:(resultType == ResultType.correct) ? AppColors.correct :  Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: isSelected ? 2 : 1,
          color:(keepBorderOneColor) ? Colors.black : isSelected ? AppColors.primary : Colors.black,
        ));
  }
   BoxDecoration inCorrectOptionDecoration() {
    return BoxDecoration(
      color:  AppColors.incorrect  ,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: isSelected ? 2 : 1,
          color:  AppColors.black  
        ));
  }
  BoxDecoration neutralOptionDecoration() {
    return BoxDecoration(
      color:   Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: isSelected ? 2 : 1,
          color:isSelected ? AppColors.primary : resultType == ResultType.correct ? Colors.black :  Colors.black,
        ));
  }
  
  
  setRightOption() {
    return  SizedBox(
                    height: 20,
                    width: 20,
                    child:(optionType == OptionType.radio) ?
                    
                     Radio<int>(
                        activeColor: AppColors.primary,
                        value: 1,
                        groupValue: 1,
                        onChanged: (value) {
                          //  setState(() {
                          //   selectedOption = value;
                          //   print("Button value: $value");
                          //   });
                        }
                        ): Checkbox(
      value: isSelected,
      onChanged: (value) {
        
      },
    )
                        );
             
  }
}


