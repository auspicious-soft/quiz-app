import 'package:flutter/material.dart';

import '../decor_container.dart';
import '../label.dart';

class CardQuestion extends StatelessWidget {
  const CardQuestion({
    super.key,
    required this.question,
  });

  final String question;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
    
      // height: 60,
      child: WidgetBaseContainer(
          corner: 10,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Label(
                  txt: question,
                  type: TextTypes.f_16_500,
                  forceColor: Colors.white,
                ),
              ),
            ),
          )),
    );
  }
}
