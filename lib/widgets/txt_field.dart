import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/config/colors.dart';

Widget textFieldWithPrefixSuffuxIconAndHintText(String hintText,
    {suffixIcon,
    prefixIcon,
    TextEditingController? controller,
    int line = 1,
    bool isSuffix = false,
    bool enable = true,
    double? radius,
    fillColor,
    bColor,
    mainTxtColor,
    hintColor,
    bool isPrefix = false,
    color,
    iconColor,
    bool obsecure = false}) {
  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      return TextField(
        maxLines: line,
        enabled: enable,
        obscureText: obsecure,
        controller: controller,
        style: GoogleFonts.plusJakartaSans(
            color: mainTxtColor ?? Colors.black, fontSize: 15.sp),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.plusJakartaSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: hintColor ?? Colors.white.withOpacity(0.60)),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            suffixIconConstraints: BoxConstraints(),
            suffixIcon: isSuffix
                ? Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            obsecure = !obsecure;
                          });
                        },
                        child: Image.asset(
                          suffixIcon ?? "assets/icons/eye.png",
                          height: 2.h,
                        )),
                  )
                : const SizedBox(),
            prefixIconConstraints: BoxConstraints(minWidth: 8.w),
            prefixIcon: isPrefix
                ? InkWell(
                    onTap: () {
                    
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Image.asset(
                        prefixIcon,
                        height:prefixIcon=="assets/icons/mail.png"?1.9.h: 2.4.h,
                        color: MyColors.primary,
                      ),
                    ),
                  )
                : const SizedBox(),
            filled: true,
            fillColor: fillColor ?? Color(0xffF7F7F7),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 35),
                borderSide:
                    BorderSide(color: bColor ?? Color(0xffD3DEF3), width: 1)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 35),
                borderSide:
                    BorderSide(color: bColor ?? Color(0xffE6DCCD), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 35),
                borderSide: BorderSide(color: Color(0xffE6DCCD), width: 1))),
      );
    },
  );
}