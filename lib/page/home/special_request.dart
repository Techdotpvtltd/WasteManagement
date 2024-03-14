import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/home/create_request.dart';
import 'package:wasteapp/page/home/view_request.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';

class SpecialRequestPage extends StatefulWidget {
  const SpecialRequestPage({super.key});

  @override
  State<SpecialRequestPage> createState() => _SpecialRequestPageState();
}

class _SpecialRequestPageState extends State<SpecialRequestPage> {
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
                    DottedBorder(
                      dashPattern: const [8, 4],
                      strokeWidth: 2,
                      strokeCap: StrokeCap.round,
                      borderType: BorderType.RRect,
                      color: Color(0xff761E37),
                      radius: Radius.circular(21),
                      child: InkWell(
                        onTap: () {
                          Get.to(CreateRequestPage());
                        },
                        child: SizedBox(
                          height: 7.4.h,
                          width: 100.w,
                          child: Center(
                            child: textWidget(
                              "+ Create a New Special Request ",
                              fontSize: 16.sp,
                              color: Color(0xff761E37),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        textWidget("Previous Requests",
                            color: Color(0xff761E37)),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    ...List.generate(
                      6,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: index == 1
                                  ? Color(0xffEFEFEF)
                                  : Color(0xffFCF3F1),
                              borderRadius: BorderRadius.circular(21)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ListTile(
                              leading: Image.asset("assets/icons/req.png",
                                  height: 3.h),
                              title: textWidget("10:43pm ",
                                  color: index == 1
                                      ? Color(0xff515151)
                                      : MyColors.primary,
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w700),
                              subtitle: Column(
                                children: [
                                  textWidget(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                      color: index == 1
                                          ? Color(0xff515151)
                                          : Color(0xff761E37),
                                      fontSize: 14.5.sp,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(height: 1.2.h),
                                  Row(
                                    children: [
                                      Spacer(),
                                      index != 1
                                          ? InkWell(
                                              onTap: () {
                                                Get.to(ViewRequestPage());
                                              },
                                              child: Container(
                                                height: 4.5.h,
                                                width: 35.w,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffD45640),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 3.5.w),
                                                    textWidget("View Response",
                                                        fontSize: 13.sp,
                                                        color: Colors.white),
                                                    Spacer(),
                                                    CircleAvatar(
                                                      radius: 2.2.h,
                                                      backgroundColor:
                                                          Color(0xff761E37),
                                                      child: Image.asset(
                                                        "assets/icons/arr1.png",
                                                        height: 1.8.h,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: 4.6.h,
                                              width: 15.4.h,
                                              decoration: BoxDecoration(
                                                  color: Color(0xff898989),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          21)),
                                              child: Center(
                                                child: textWidget(
                                                    "Waiting For Response",
                                                    fontSize: 12.6.sp,
                                                    color: Colors.white),
                                              ),
                                            ),
                                    ],
                                  ),
                                  SizedBox(height: 1.2.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ))));
  }
}
