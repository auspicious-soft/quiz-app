
import 'package:flutter/widgets.dart';

class DotColored extends StatelessWidget {
  const DotColored({
    super.key,
    required this.dotColor,
  });

  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
  borderRadius: BorderRadius.circular(4),
  child: Container(height: 10,width: 10,color: dotColor));
  }
}