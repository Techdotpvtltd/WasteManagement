import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/auth/done_password.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/widgets/txt_field.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
import '../../widgets/custom_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
                              Get.find<MyDrawerController>().toggleDrawer();
                            },
                            child: Image.asset("assets/icons/draw.png",
                                height: 1.8.h)),
                        Spacer(),
                        text_widget("Change Password",
                            fontSize:  17.5.sp, fontWeight: FontWeight.w700)
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
                        "Enter Previous Password",
                        radius: 34,
                        fillColor: Color(0xffF8F8F8),
                        bColor: Color(0xffE8ECF4),
                        hintColor: Color(0xff000000).withOpacity(0.40),
                        isPrefix: true,
                        prefixIcon: "assets/icons/lock.png",
                        isSuffix: true),
                    SizedBox(height: 2.h),
                    textFieldWithPrefixSuffuxIconAndHintText(
                        "Enter New Password",
                        radius: 34,
                        fillColor: Color(0xffF8F8F8),
                        bColor: Color(0xffE8ECF4),
                        hintColor: Color(0xff000000).withOpacity(0.40),
                        isPrefix: true,
                        prefixIcon: "assets/icons/lock.png",
                        isSuffix: true),
                    SizedBox(height: 2.h),
                    textFieldWithPrefixSuffuxIconAndHintText(
                        "Re-Enter New Password",
                        radius: 34,
                        fillColor: Color(0xffF8F8F8),
                        bColor: Color(0xffE8ECF4),
                        hintColor: Color(0xff000000).withOpacity(0.40),
                        isPrefix: true,
                        prefixIcon: "assets/icons/lock.png",
                        isSuffix: true),
                    SizedBox(height: 15.h),
                    gradientButton("Save", font: 15.6, txtColor: MyColors.white,
                        ontap: () {
                      Get.to(DonePassword());
                    },
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
