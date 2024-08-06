import 'package:comptia/features/presentation/widgets/decor_container.dart';
import 'package:comptia/features/presentation/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_settings/theme/app_colors.dart';

class CardRow extends StatelessWidget {
  const CardRow({
    super.key,
    required this.title,
  this.corner = 10.0  , this.color = AppColors.white});
final String title;
final double corner ;
final Color color;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 60.h,
      decoration: BoxDecoration(border: Border.all(width: 1,color: color,
        
         ), 
         color: Colors.white,
          borderRadius:   BorderRadius.all(Radius.circular(corner)),
               boxShadow: const [BoxShadow(offset: Offset(1, 1), blurRadius: 1, color: Colors.black12, spreadRadius: 1)],
          
         ),
         child:  Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Label(txt: title, type: TextTypes.f_14_450),
                )),);
    return const SizedBox(
        height: 50,
        width: double.infinity,
        child: WidgetBaseContainer(
            corner: 10,
            color: Colors.white,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Label(txt: "Quiz App", type: TextTypes.f_14_450),
                ))
                )
                );
  }
}
