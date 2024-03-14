import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

class NotificationScreen extends StatefulWidget {
  final bool isDrawer;
  const NotificationScreen({super.key, required this.isDrawer});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                        widget.isDrawer
                            ? InkWell(
                                onTap: () {
                                  Get.find<MyDrawerController>().toggleDrawer();
                                },
                                child: Image.asset("assets/icons/draw.png",
                                    height: 1.8.h))
                            : InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Remix.arrow_left_s_line,
                                  size: 4.h,
                                ),
                              ),
                        Spacer(),
                        textWidget("Notification",
                            fontSize: 17.5.sp, fontWeight: FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: 2.h),
                    ...List.generate(
                      6,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              title: textWidget(
                                "Notification Heading",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: textWidget(
                                  "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                                  color: Color(0xff8F8F8F),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            ))));
  }
}
