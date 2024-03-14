import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/config/colors.dart';
import 'package:wasteapp/page/auth/login_page.dart';
import 'package:wasteapp/widgets/custom_button.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
//
  @override
  State<IntroPage> createState() => _IntroPageState();
}

int currentPage = 0;
PageController controller = PageController(initialPage: 0);

class _IntroPageState extends State<IntroPage> {
  List<String> imagePaths = [];
  bool load = false;

  @override
  void initState() {
    _initImages();
    super.initState();
  }

  Future _initImages() async {
    final Map<String, dynamic> assets =
        jsonDecode(await rootBundle.loadString('AssetManifest.json'));

    setState(() {
      imagePaths = assets.keys
          .where((String key) => key.contains('boarding/'))
          .where((String key) => key.contains('.png'))
          .toList();
      load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load
          ? PageView(
              controller: controller,
              children: [
                page1(index: currentPage),
                page1(index: currentPage),
                page1(index: currentPage),
              ],
            )
          : SizedBox(),
    );
  }

  Widget page1({int index = 0}) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          FadeIn(
              delay: Duration(milliseconds: 200),
              child: Image.asset(
                imagePaths[index],
                width: 100.w,
                fit: BoxFit.cover,
              )),
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: FadeInDown(
              delay: Duration(milliseconds: 300),
              child: SafeArea(
                child: Container(
                  width: 86.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.h),
                        textWidget(
                            index == 0
                                ? "Get Pickup Alerts"
                                : index == 1
                                    ? "Make Special Requests"
                                    : "Direct Chats",
                            color: MyColors.primary,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w800),
                        SizedBox(height: 1.h),
                        textWidget(
                          "Michard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,",
                          color: Color(0xff000000),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            Expanded(
                              child: gradientButton("Next",
                                  font: 15.6,
                                  txtColor: MyColors.white, ontap: () {
                                if (currentPage == 2) {
                                  Get.offAll(LoginPage());
                                } else {
                                  setState(() {
                                    currentPage++;
                                  });
                                  controller.animateToPage(currentPage,
                                      duration: Duration(microseconds: 1),
                                      curve: Curves.easeIn);
                                }
                              },
                                  // booking nai ki?? ye static request kyun hein??
                                  width: 90,
                                  height: 5.6,
                                  isColor: true,
                                  clr: MyColors.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
