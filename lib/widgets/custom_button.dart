import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/utilities/constants/constants.dart';

Widget gradientButton(
  String title, {
  bool isColor = false,
  // String? iconPath,
  Color clr = Colors.white,
  Color? bclr,
  Function? ontap,
  Color txtColor = Colors.white,
  double font = 0,
  double height = 0,
  double width = 0,
  bool isLoading = false,
  // bool dot = false
}) {
  return InkWell(
    onTap: () {
      if (ontap != null && !isLoading) {
        ontap();
      }
    },
    child: Container(
      width: width.w,
      height: height == 0 ? 6.3.h : height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: isColor ? clr : Colors.transparent,
        border:
            isColor ? null : Border.all(color: bclr ?? Colors.black, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            CircularProgressIndicator(
              color: Colors.white,
            ),
          if (isLoading) gapW10,
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: font == 0 ? 17.sp : font.sp,
              fontWeight: FontWeight.w600,
              color: txtColor,
            ),
          ),
        ],
      ),
    ),
  );
}
