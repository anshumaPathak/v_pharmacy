import 'dart:ui';

import 'package:flutter/cupertino.dart';
class AppColor{
static const whiteColor = Color(0xffffffff);
static const greenColor = Color(0xff008535);
static const blueColor = Color(0xff155dfc);
static const lightGreenColor = Color(0xff00c951);
static const lightWhiteColor = Color(0xfff9fafb);
static const lightBlueColor = Color(0xffebf3ff);






static final LinearGradient containerColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    greenColor,
    blueColor,
  ],
);

}