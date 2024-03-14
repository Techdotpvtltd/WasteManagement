import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/widgets/txt_field.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
import '../../widgets/custom_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                        textWidget("Edit Profile",
                            fontSize: 17.5.sp, fontWeight: FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Center(
                        child: Image.asset(
                      "assets/icons/dp.png",
                      height: 10.h,
                    )),
                    SizedBox(height: 3.h),
                    textFieldWithPrefixSuffuxIconAndHintText("Enter Name",
                        radius: 34,
                        fillColor: Color(0xffF8F8F8),
                        bColor: Color(0xffE8ECF4),
                        hintColor: Color(0xff000000).withOpacity(0.40),
                        isPrefix: true,
                        prefixIcon: "assets/icons/user.png",
                        isSuffix: true,
                        suffixIcon: 'assets/icons/pen.png'),
                    SizedBox(height: 2.h),
                    textFieldWithPrefixSuffuxIconAndHintText(
                        "Enter Phone Number",
                        radius: 34,
                        fillColor: Color(0xffF8F8F8),
                        bColor: Color(0xffE8ECF4),
                        hintColor: Color(0xff000000).withOpacity(0.40),
                        isPrefix: true,
                        prefixIcon: "assets/icons/phone.png",
                        isSuffix: true,
                        suffixIcon: 'assets/icons/pen.png'),
                    SizedBox(height: 2.h),
                    textFieldWithPrefixSuffuxIconAndHintText("Enter Email",
                        radius: 34,
                        fillColor: Color(0xffF8F8F8),
                        bColor: Color(0xffE8ECF4),
                        hintColor: Color(0xff000000).withOpacity(0.40),
                        isPrefix: true,
                        prefixIcon: "assets/icons/mail.png",
                        isSuffix: true,
                        suffixIcon: 'assets/icons/pen.png'),
                    SizedBox(height: 2.h),
                    textFieldWithPrefixSuffuxIconAndHintText("City",
                        radius: 34,
                        fillColor: Color(0xffF8F8F8),
                        bColor: Color(0xffE8ECF4),
                        hintColor: Color(0xff000000).withOpacity(0.40),
                        isPrefix: true,
                        prefixIcon: "assets/icons/pp.png",
                        isSuffix: true,
                        suffixIcon: 'assets/icons/pen.png'
                        // line: 5
                        ),
                    SizedBox(height: 2.h),
                    textFieldWithPrefixSuffuxIconAndHintText("Address",
                        radius: 34,
                        fillColor: Color(0xffF8F8F8),
                        bColor: Color(0xffE8ECF4),
                        hintColor: Color(0xff000000).withOpacity(0.40),
                        isPrefix: true,
                        prefixIcon: "assets/icons/pp.png",
                        isSuffix: true,
                        suffixIcon: 'assets/icons/pen.png'
                        // line: 5
                        ),
                    SizedBox(height: 4.h),
                    gradientButton("Save",
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
