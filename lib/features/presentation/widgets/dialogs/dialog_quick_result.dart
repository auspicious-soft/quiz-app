import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_settings/constants/app_assets.dart';
import '../../../../core/app_settings/constants/app_dim.dart';
import '../../../../core/app_settings/theme/app_colors.dart';
import '../dot_colored.dart';
import '../label.dart';
import '../widget_circular_prog.dart';
class ModelQuickResult{
final double resultPercent;
final int totalCorrect;
final int totalIncorrect;

  ModelQuickResult({required this.resultPercent, required this.totalCorrect, required this.totalIncorrect});
}
enum ButtonActions {
tryAgain, showAnswer
}
class DialogQuickResult {
  DialogQuickResult._();

  static Future<dynamic> popup({required BuildContext context, required ModelQuickResult resultData , required  Function(ButtonActions) callBack
  
  }) {
    //const progRadius = 110.0;
    //const percentInString = resultPercent/10;
  return showDialog(
                                          context: context, 
                                          // insetPadding: EdgeInsets.all(10),
                                          builder: (  context){
return Dialog(
 insetPadding: const EdgeInsets.all(10),
 child: SingleChildScrollView(
   child:  Container(
        width: double.infinity,
       // height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white
        ),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child:  Column(
    children: [
      Row(children: [const Spacer(),IconButton(
        iconSize: 21,
        onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.cancel,color: AppColors.primary,))],),
      Image.asset(AppAssets.batch , height: 140.h, width: 140.w, fit: BoxFit.fitHeight,
     ),
     padVertical(40),
   
   Container(
    width: double.infinity,
    //height: 200,
    decoration: BoxDecoration(border: Border.all(width: 2,color: AppColors.primary,
       
        ), 
      color: AppColors.white,
         borderRadius:   const BorderRadius.all(Radius.circular(10)),
              boxShadow: const [BoxShadow(offset: Offset(1, 1), blurRadius: 1, color: Colors.black12, spreadRadius: 1)],
         
        ),
     child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
         WidgetCircularProgress(resultPercent: resultData.resultPercent),
     padHorizontal(5),
      Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
     _quickResultRow(dotColor: Colors.green,title: "Correct Answer") ,
     padVertical(10),
     _quickResultRow(dotColor: Colors.red,title: "Incorrect Answer") ,
    
      padVertical(10),
      _quickResultRow(dotColor: AppColors.secondaryDark,title: "Not Answer") ,
    
      ],)
      ],
    ),
     ),
   ),
   
   Container(
     width: MediaQuery.of(context).size.width * 0.7,
    // height: 100,
     decoration: const BoxDecoration(
    
         border: Border(
           right: BorderSide(width: 2,
     color: AppColors.primary,),
        left: BorderSide(width: 2,
     color: AppColors.primary,),
        bottom: BorderSide(width: 2,
     color: AppColors.primary,),
      ),
         borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
         
         ),
         child: Padding(
           padding: const EdgeInsets.all(15.0),
           child: _quickResultCount(howManyCorrect: "${resultData.totalCorrect}",howManyInCorrect: "${resultData.totalIncorrect}"),
         ),
         ),
      
      padVertical(20),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        onPressed: (){
Navigator.pop(context);
  callBack(ButtonActions.tryAgain);
        }, child: const Text("Try Again")) ,
   padVertical(10),
      ElevatedButton(onPressed: (){
        Navigator.pop(context);
        callBack(ButtonActions.showAnswer);
      }, child: const Text("Show Answers"))  ,
      padVertical(10)
   ],),
      ),
      
  //  Stack(
  //   fit: StackFit.expand,
  //   alignment: Alignment.center,
  //   children: <Widget>[
      
  //     // Positioned(
  //     //   top: -400,
  //     //   child: Image.network("https://i.imgur.com/2yaf2wb.png", width: 150, height: 150)
  //     // )
  //   ],
  //    ),
 ),)
 ;
                                                                                });
}

static Row _quickResultCount({required String howManyCorrect, required String howManyInCorrect}) {
  return Row(children: [
    Expanded(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center, 
          mainAxisAlignment: MainAxisAlignment.start, children: [
const Label(txt: "Correct Answer", type: TextTypes.f_14_450),
padVertical(10),
Label(txt: howManyCorrect, type: TextTypes.f_20_600)

       ],)),
      padHorizontal(5),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
const Label(forceAlignment: TextAlign.center, txt: "Incorrect Answer", type: TextTypes.f_14_450),
padVertical(10),
Label(txt: howManyInCorrect, type: TextTypes.f_20_600)

       ],))
       ],);
}

static Row _quickResultRow({required Color dotColor, required String title}) {
  return Row(children: [ 
      DotColored(dotColor: dotColor),
    padHorizontal(5),
       Label(txt: title, type: TextTypes.f_12_400)
  
  ],);
}

  
}

class WidgetCircularProgress extends StatelessWidget {
  const WidgetCircularProgress({
    super.key,
    required this.resultPercent,
  });

  final double resultPercent;

  @override
  Widget build(BuildContext context) {
    const progRadius = 110.0;
    return SizedBox(
     width: progRadius,
     height: progRadius,
     child: CustomPaint(
       size: const Size(progRadius, progRadius), // no effect while adding child
       painter: CircularPaint(
         progressValue: resultPercent/100, //[0-1]
       ),
       child:   Center(
         child: ClipRRect(
           borderRadius: BorderRadius.circular(progRadius-40/2),
           child:Container(
               width: progRadius-40,
             height: progRadius-40,
             color: Colors.white, child:   Center(child: Text("$resultPercent%")),),
         ),
       ),
     ),
    );
  }
}