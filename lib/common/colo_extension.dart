import 'dart:ui';
import 'package:flutter/material.dart';

class TColor {
  static Color get brandColor1 => const Color(0xff92A3FD);
  static Color get brandColor2 => const Color(0xff9DCEFF);
  static Color get secondaryColor1 => const Color(0xffC58BF2);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);
  static Color get blackColor => const Color(0xff1D1617);
  static Color get whiteColor => const Color(0xffFFFFFF);
  static Color get greyColor1 => const Color(0xff7B6F72);
  static Color get greyColor2 => const Color(0xffADA4A5);
  static Color get greyColor3 => const Color(0xffDDDADA);
  static Color get borderColor => const Color(0xffF7F8F8);

  static List<Color> get brandColorG => [brandColor1, brandColor2];
  static List<Color> get secondaryColorG => [secondaryColor1, secondaryColor2];
  static List<Color> get greyColorG => [greyColor1, greyColor2, greyColor3];
}
