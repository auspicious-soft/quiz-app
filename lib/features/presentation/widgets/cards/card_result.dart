import 'package:comptia/features/presentation/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
class CardResult extends StatelessWidget {
  const CardResult({
    super.key,
    required this.title, required this.color});
final String title; 
final Color color;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 70.h,
      decoration: BoxDecoration(border: Border.all(width: 1,color: color,
        
         ), 
         color: color,
          borderRadius:   const BorderRadius.all(Radius.circular(3)),
              // boxShadow: const [BoxShadow(offset: Offset(1, 1), blurRadius: 1, color: Colors.black12, spreadRadius: 1)],
          
         ),
         child:  Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: [
               Expanded(child: Label(txt: title, type: TextTypes.f_14_450)),
               const Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black,)
             ],
           ),
         ),);
   }
}
