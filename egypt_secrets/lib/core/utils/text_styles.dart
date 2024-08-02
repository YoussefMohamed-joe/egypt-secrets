import 'package:egypt_secrets/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTitleStyle(
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: GoogleFonts.roboto().fontFamily,
    color: color ?? AppColors.dark,
    fontSize: fontSize ?? 20,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodyStyle(
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: GoogleFonts.roboto().fontFamily,
    color: color ?? AppColors.dark,
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getHeaderStyle(
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: GoogleFonts.encodeSans().fontFamily,
    color: color ?? AppColors.white,
    fontSize: fontSize ?? 62,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}
