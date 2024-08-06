import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox padVertical([int defaultVal = 5]) {
  return SizedBox(height: defaultVal.toDouble().h);
}

SizedBox padHorizontal(int pad) {
  return SizedBox(width: pad.toDouble().w);
}

SizedBox emptyView() {
  return const SizedBox();
}
