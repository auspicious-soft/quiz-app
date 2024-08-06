import 'package:comptia/core/app_settings/constants/set_strings.dart';
import 'package:comptia/features/presentation/widgets/text_box.dart';
import 'package:flutter/material.dart';

import 'app_launch_gate.dart';

mixin ALGWidgets<StatefulWidget> on State<AppLaunchGate> {
  Widget topText() {
    return Column(
      children: [SetString.preparedBy.withTextBox(ofType: TextType.largeTitle)],
    );
  }
}
