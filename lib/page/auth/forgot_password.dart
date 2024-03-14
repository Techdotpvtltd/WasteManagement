import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/widgets/txt_field.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
import '../../widgets/custom_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Remix.arrow_left_s_line,
                            size: 4.h,
                          ),
                        ),
                        Spacer(),
                        textWidget("Forgot Password",
                            fontSize: 19.sp, fontWeight: FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Center(
                        child: Image.asset(
                      "assets/icons/pass.png",
                      height: 10.h,
                    )),
                    SizedBox(height: 3.h),
                    textFieldWithPrefixSuffuxIconAndHintText(
                      "Enter Email",
                      radius: 34,
                      fillColor: Color(0xffF8F8F8),
                      bColor: Color(0xffE8ECF4),
                      hintColor: Color(0xff000000).withOpacity(0.40),
                      isPrefix: true,
                      prefixIcon: "assets/icons/mail.png",
                    ),
                    SizedBox(height: 15.h),
                    gradientButton("Reset Password",
                        font: 15.6,
                        txtColor: MyColors.white,
                        ontap: () {},
                        // booking nai ki?? ye static request kyun hein??
                        width: 90,
                        height: 6,
                        isColor: true,
                        clr: MyColors.primary),
                    SizedBox(height: 10.h),
                  ]),
            ))));
  }
}
