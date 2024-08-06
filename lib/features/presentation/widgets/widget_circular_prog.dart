import 'package:flutter/material.dart';
import 'package:comptia/core/app_settings/theme/app_colors.dart';
import 'dart:math' as math; 
 
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


//:::::::::::::PAINT CLASS:::::::::::::;

double deg2rad(double deg) => deg * math.pi / 180;

class CircularPaint extends CustomPainter {
  /// ring/border thickness, default  it will be 8px [borderThickness].
  final double borderThickness;
  final double progressValue;

  CircularPaint({
    this.borderThickness = 15.0,
    required this.progressValue,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    final rect =
        Rect.fromCenter(center: center, width: size.width, height: size.height);

    Paint paint = Paint()
      ..color = AppColors.secondary //.grey.withOpacity(.3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness;

    //grey background
    canvas.drawArc(
      rect,
      deg2rad(0),
      deg2rad(360),
      false,
      paint,
    );

    Paint progressBarPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
         
          Colors.green, 
           Colors.green, 
           Colors.red, 
            Colors.red, 
        ],
      ).createShader(rect);
    canvas.drawArc(
      rect,
      deg2rad(-90),
      deg2rad(360 * progressValue),
      false,
      progressBarPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}