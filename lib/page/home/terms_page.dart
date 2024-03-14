import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
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
                        // Spacer(),
                        // text_widget("Forgot Password",
                        // fontSize: 19.sp,
                        // fontWeight: FontWeight.w700
                        // )
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Center(
                        child: Image.asset(
                      "assets/icons/sup.png",
                      height: 13.h,
                    )),
                    SizedBox(height: 2.h),
                    Center(
                      child: text_widget("Rules and Regulations",
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4.h),
                    text_widget(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                        color: Color(0xff1E1E1E),
                        fontSize: 13.8.sp,
                        fontWeight: FontWeight.w400),
                    SizedBox(height: 2.h),
                    text_widget(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                        color: Color(0xff1E1E1E),
                        fontSize: 13.8.sp,
                        fontWeight: FontWeight.w400),
                    SizedBox(height: 2.h),
                    text_widget("Changes to the Service and/or Terms:",
                        fontWeight: FontWeight.w600, fontSize: 16.sp),
                    SizedBox(height: 2.h),
                    text_widget(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                        color: Color(0xff1E1E1E),
                        fontSize: 13.8.sp,
                        fontWeight: FontWeight.w400),
                    SizedBox(height: 2.h),
                    SizedBox(height: 2.h),
                    text_widget(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                        color: Color(0xff1E1E1E),
                        fontSize: 13.8.sp,
                        fontWeight: FontWeight.w400),
                    SizedBox(height: 2.h),
                    SizedBox(height: 2.h),
                    text_widget(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                        color: Color(0xff1E1E1E),
                        fontSize: 13.8.sp,
                        fontWeight: FontWeight.w400),
                    SizedBox(height: 2.h),
                    SizedBox(height: 2.h),
                    text_widget(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.",
                        color: Color(0xff1E1E1E),
                        fontSize: 13.8.sp,
                        fontWeight: FontWeight.w400),
                    SizedBox(height: 6.h),
                  ]),
            ))));
  }
}
