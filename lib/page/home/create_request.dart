import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/widgets/txt_field.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
import '../../widgets/custom_button.dart';
class CreateRequestPage extends StatefulWidget {
  const CreateRequestPage({super.key});

  @override
  State<CreateRequestPage> createState() => _CreateRequestPageState();
}

class _CreateRequestPageState extends State<CreateRequestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.white,

      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Row(
                    children: [
                    InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Remix.arrow_left_s_line,
                        size: 4.h,
                        
                        ),
                      ),
                      Spacer(),
                      text_widget("Special Requests",
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Center(child: Image.asset("assets/icons/req.png",height: 8.h,)),
                  SizedBox(height: 5.h),
            text_widget("Create a New Special Request ",
        fontSize: 16.sp,
        color: Color(0xff761E37),
        ),
               SizedBox(height: 3.h),
      textFieldWithPrefixSuffuxIconAndHintText("Write your special request here..",radius: 34,
                                fillColor: Color(0xffF8F8F8),
                                bColor: Color(0xffE8ECF4),
                                hintColor: Color(0xff000000).withOpacity(0.40),
                                isPrefix: false,
                                line: 6,
                                prefixIcon: "assets/icons/lock.png",
                                ),
                                SizedBox(height: 6.h),
                                 gradientButton("Send",
                                  font: 15.6,
                                  txtColor: MyColors.white,
                                  ontap: () {
                                 
             
                                  },
                                  // booking nai ki?? ye static request kyun hein??
                                  width: 90,
                                  height: 6,
                                  isColor: true,
                                  clr: MyColors.primary),
              ]),
          ))));
  }
}