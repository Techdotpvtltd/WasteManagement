import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/widgets/custom_button.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
class DonePassword extends StatelessWidget {
  const DonePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/reset.png")),
          Positioned.fill(child: Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  text_widget("Password Changed!",color: Colors.white,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700
                  ),
                  SizedBox(height: 12.h),
              gradientButton("Continue",
                                  font: 15.6,
                                  txtColor: MyColors.primary,
                                  ontap: () {
                                   
             Get.offAll(UserDrawer());
                                  },
                                  // booking nai ki?? ye static request kyun hein??
                                  width: 90,
                                  height: 6,
                                  isColor: true,
                                  clr: MyColors.white),
                                  SizedBox(height: 3.h),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}