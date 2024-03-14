import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/home/give_review.dart';
import 'package:wasteapp/widgets/custom_button.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';

class ViewRequestPage extends StatefulWidget {
  const ViewRequestPage({super.key});

  @override
  State<ViewRequestPage> createState() => _ViewRequestPageState();
}

class _ViewRequestPageState extends State<ViewRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: gradientButton("Rate Our Response",
            font: 15.6, txtColor: MyColors.white, ontap: () {
          Get.to(GiveReview(
            isDrawer: false,
          ));
        },
            // booking nai ki?? ye static request kyun hein??
            width: 90,
            height: 6,
            isColor: true,
            clr: MyColors.primary),
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
                        textWidget("Special Requests",
                            fontSize: 19.sp, fontWeight: FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Center(
                        child: Image.asset(
                      "assets/icons/req.png",
                      height: 8.h,
                    )),
                    SizedBox(height: 3.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: MyColors.primary,
                            borderRadius: BorderRadius.circular(21)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: Image.asset("assets/icons/req1.png",
                                height: 3.h),
                            title: textWidget("10:43pm ",
                                color: Color(0xffFFFFFF).withOpacity(0.59),
                                fontSize: 14.5.sp,
                                fontWeight: FontWeight.w700),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: textWidget(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFCF3F1),
                            borderRadius: BorderRadius.circular(21)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            title: textWidget("10:43pm Mar 6 2024  ",
                                color: Color(0xffD6563D),
                                fontSize: 14.5.sp,
                                fontWeight: FontWeight.w700),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: textWidget(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                  color: Color(0xff761E37),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ))));
  }
}
