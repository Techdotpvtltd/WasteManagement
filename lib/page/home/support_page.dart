import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/widgets/txt_field.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
import '../../widgets/custom_button.dart';
class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {

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
                        Get.find<MyDrawerController>().toggleDrawer();
                      },
                      child: Image.asset("assets/icons/draw.png",height: 1.8.h)
                      ),
                      Spacer(),
                      text_widget("Contact Support",
                      fontSize:  17.5.sp,
                      fontWeight: FontWeight.w700
                      )
                    ],
                  ),
                  SizedBox(height: 4.h),
               Center(child: Image.asset("assets/icons/sup.png",height: 13.h,)),
                  SizedBox(height: 3.h),
                  text_widget("Fill the information",
                  fontSize: 15.6.sp,
                  fontWeight: FontWeight.w600
                  ),
                  SizedBox(height: 3.h),
               
                                textFieldWithPrefixSuffuxIconAndHintText("Enter First Name",radius: 34,

                                fillColor: Color(0xffF8F8F8),
                                bColor: Color(0xffE8ECF4),
                                hintColor: Color(0xff000000).withOpacity(0.40),
                                isPrefix: true,
                                prefixIcon: "assets/icons/user.png",
                                  
                              
                              
                                ),
                                    SizedBox(height: 2.h),
               
                                textFieldWithPrefixSuffuxIconAndHintText("Enter Phone Number",radius: 34,

                                fillColor: Color(0xffF8F8F8),
                                bColor: Color(0xffE8ECF4),
                                hintColor: Color(0xff000000).withOpacity(0.40),
                                isPrefix: true,
                                prefixIcon: "assets/icons/phone.png",
                                  
                              
                              
                                ),
                                    SizedBox(height: 2.h),
               
                                textFieldWithPrefixSuffuxIconAndHintText("Enter Email",radius: 34,

                                fillColor: Color(0xffF8F8F8),
                                bColor: Color(0xffE8ECF4),
                                hintColor: Color(0xff000000).withOpacity(0.40),
                                isPrefix: true,
                                prefixIcon: "assets/icons/mail.png",
                                  
                              
                              
                                ),
                                     SizedBox(height: 2.h),
               
                                textFieldWithPrefixSuffuxIconAndHintText("Type Message",radius: 34,

                                fillColor: Color(0xffF8F8F8),
                                bColor: Color(0xffE8ECF4),
                                hintColor: Color(0xff000000).withOpacity(0.40),
                                isPrefix: false,
                                line: 6
                                  
                              
                              
                                ),
                                SizedBox(height: 12.h),
                                gradientButton("Reset Password",
                                  font: 15.6,
                                  txtColor: MyColors.white,
                                  ontap: () {
                                   
             
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