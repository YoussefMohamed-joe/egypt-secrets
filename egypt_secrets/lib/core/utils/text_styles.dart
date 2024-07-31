import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle getTitleStyle(
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Roboto',
    color: color ?? AppColors.dark,
    fontSize: fontSize ?? 20,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodyStyle(
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Roboto',
    color: color ?? AppColors.dark,
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getHeaderStyle(
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    color: color ?? AppColors.white,
    fontSize: fontSize ?? 60,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
