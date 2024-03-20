import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/widgets/custom_button.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';

class DoneReview extends StatelessWidget {
  const DoneReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset("assets/images/rev.png", fit: BoxFit.cover)),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textWidget("Feedback Submit\nSuccessfully",
                      color: Colors.white,
                      textAlign: TextAlign.center,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700),
                  SizedBox(height: 12.h),
                  gradientButton(
                    "Go to Home",
                    font: 15.6,
                    txtColor: MyColors.primary,
                    ontap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    // booking nai ki?? ye static request kyun hein??
                    width: 90,
                    height: 6,
                    isColor: true,
                    clr: MyColors.white,
                  ),
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
