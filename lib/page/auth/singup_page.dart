import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/auth/addtional_info.dart';
import 'package:wasteapp/page/auth/login_page.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../widgets/txt_field.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 25.h,
              ),
              SizedBox(
                  height: 20.h,
                  child: Image.asset(
                    "assets/icons/log1.png",
                    fit: BoxFit.fill,
                  )),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/icons/logo.png",
                  height: 16.h,
                ),
              ))
            ],
          ),
          SizedBox(height: 4.h),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget("Join Us",
                      fontSize: 20.sp, fontWeight: FontWeight.bold),
                  SizedBox(height: 3.h),
                  textFieldWithPrefixSuffuxIconAndHintText("Enter Email",
                      radius: 34,
                      fillColor: Color(0xffF8F8F8),
                      bColor: Color(0xffE8ECF4),
                      hintColor: Color(0xff000000).withOpacity(0.40),
                      isPrefix: true,
                      prefixIcon: "assets/icons/user.png"),
                  SizedBox(height: 2.h),
                  textFieldWithPrefixSuffuxIconAndHintText(
                    "Password",
                    radius: 34,
                    fillColor: Color(0xffF8F8F8),
                    bColor: Color(0xffE8ECF4),
                    hintColor: Color(0xff000000).withOpacity(0.40),
                    isPrefix: true,
                    prefixIcon: "assets/icons/lock.png",
                  ),
                  SizedBox(height: 2.h),
                  textFieldWithPrefixSuffuxIconAndHintText(
                    "Confirm Password",
                    radius: 34,
                    fillColor: Color(0xffF8F8F8),
                    bColor: Color(0xffE8ECF4),
                    hintColor: Color(0xff000000).withOpacity(0.40),
                    isPrefix: true,
                    prefixIcon: "assets/icons/lock.png",
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(AdditionalInfoPage());
                        },
                        child: Container(
                          height: 5.5.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                              color: Color(0xffD45640),
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            children: [
                              SizedBox(width: 3.5.w),
                              textWidget("Sign Up",
                                  fontSize: 16.5.sp, color: Colors.white),
                              Spacer(),
                              CircleAvatar(
                                radius: 2.8.h,
                                backgroundColor: Color(0xff761E37),
                                child: Image.asset(
                                  "assets/icons/arr1.png",
                                  height: 1.8.h,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Image.asset("assets/icons/or.png", fit: BoxFit.fill),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Spacer(),
                      Image.asset("assets/icons/fb.png", height: 6.h),
                      SizedBox(width: 4.w),
                      Image.asset("assets/icons/apple.png", height: 6.h),
                      SizedBox(width: 4.w),
                      Image.asset("assets/icons/google.png", height: 6.h),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  InkWell(
                    onTap: () {
                      Get.to(LoginPage());
                    },
                    child: Container(
                      width: Get.width,
                      height: 5.8.h,
                      decoration: BoxDecoration(
                          color: Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(24)),
                      child: Center(
                        child: Text.rich(
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 15.5.sp, fontWeight: FontWeight.w400),
                            TextSpan(
                                text: 'Already have an Account? ',
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'Sign In',
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 15.6.sp,
                                        fontWeight: FontWeight.w700),
                                  )
                                ])),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
