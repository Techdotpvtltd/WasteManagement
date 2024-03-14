import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget text_widget(String text,
    {
    fontSize,
    color,
    fontWeight,
    decoration,
    textAlign,
    letterSpacing,
    decorationColor,
    decorationWidth,
    maxline,
    bool isShadow = false}) {
  return Text(
    text,
    maxLines: maxline,
    textAlign: textAlign,
    style: GoogleFonts.plusJakartaSans(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 17.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationThickness: decorationWidth??1.0,
      letterSpacing: letterSpacing,
    ),
  );
}


//txtWidget2("hello brother",
//16,
//Fontwr.w300
//),
