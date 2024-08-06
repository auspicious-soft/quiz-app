import 'package:flutter/material.dart';

import '../../../core/app_settings/theme/app_colors.dart';

class WidgetBaseContainer extends StatelessWidget {
  const WidgetBaseContainer({super.key ,required this.child, this.corner = 20.0  , this.color = AppColors.primary});
final double corner ;
final Color color;
final Widget child;
  @override
  Widget build(BuildContext context) {
   return Container(decoration: BoxDecoration(border: Border.all(width: 1,color: color,
        
         ), 
         color: color,
          borderRadius:   BorderRadius.all(Radius.circular(corner)),
               boxShadow: const [BoxShadow(offset: Offset(1, 1), blurRadius: 1, color: Colors.black12, spreadRadius: 1)],
          
         ),
         child: child,);
  }
  
}
// BoxDecoration decoreContainer({Color myColor = AppColors.primary, double corner = 20}){
// return BoxDecoration(border: Border.all(width: 1,color: myColor,
        
//          ), 
//          color: AppColors.primary,
//           borderRadius:   BorderRadius.all(Radius.circular(corner)),
                
//          );
// }
