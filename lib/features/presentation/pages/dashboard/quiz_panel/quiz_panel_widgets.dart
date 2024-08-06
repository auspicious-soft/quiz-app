import 'package:comptia/features/presentation/pages/dashboard/quiz_panel/pg_quiz_panel.dart';
import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/core/app_settings/theme/app_colors.dart';
import 'package:comptia/features/presentation/pages/navigations/nav_cntrl.dart';
import 'package:comptia/features/presentation/pages/navigations/pg_const.dart';
import 'package:comptia/features/presentation/widgets/decor_container.dart';
import 'package:comptia/features/presentation/widgets/dialogs/dialog_quick_result.dart';
import 'package:comptia/features/presentation/widgets/label.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/cards/card_question.dart';


extension QuizPanelWidget on PgQuizPanel{
  Widget widgetQuestion() {
    var testQuiestion1 =
        "What do you know about work group computing  What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing What do you know about work group computing ";
    var testQuiestion2 =
        "Q2: Puting What do you know about work group computing What do you know about work group";

    return CardQuestion(question: testQuiestion2);
  }

  Padding widgetOption({required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: double.infinity,
        // height:50.h ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.black,
            )),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Row(
                children: [
                  const Expanded(
                      child: Label(
                          txt:
                              "AnswerAnswerAnswerAnswerAnswerAnswerAnswerAnswerAnswerAnswerAnswerAnswer 1",
                          type: TextTypes.f_14_450)),
                  SizedBox(
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
                          }))
                ],
              ),
            )),
      ),
    );
  
  }
SizedBox quizFooter(BuildContext context) {

    return SizedBox(
                            height: 50.h,
                            child: Row(
                              children: [
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          NavigationController.navigateTo(context, PageConst.pgReport);
                                        },
                                        child: const Icon(
                                            Icons.flag_outlined))),
                                padHorizontal(10),
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          DialogQuickResult.popup(context: context,resultData: ModelQuickResult(resultPercent:70, totalCorrect: 30, totalIncorrect: 70), callBack: (action ) { 
if(action == ButtonActions.showAnswer){
  NavigationController.navigateTo(context, PageConst.resultScreen);
}

                                           });
                                                                                //  BlocProvider.of<CubitQuestionProgress>(context).forward();
                                        }
                                        ,
                                        child: const Text("Next Question")))
                              ],
                            ));
  }

 

  Center widgetTimer(String currentTime) {
    return  Center(
                  child: Label(
                txt: currentTime,
                type: TextTypes.f_16_500,
                forceColor: Colors.red,
              ));
  }

  LinearProgressIndicator widgetProgressIndicator(double prog) {
    return LinearProgressIndicator(
                value: prog,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.primary),
                backgroundColor: Colors.grey.shade300,
              );
  }

}


