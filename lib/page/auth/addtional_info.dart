import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/config/colors.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/widgets/custom_button.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../widgets/txt_field.dart';
class AdditionalInfoPage extends StatefulWidget {
  const AdditionalInfoPage({super.key});

  @override
  State<AdditionalInfoPage> createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends State<AdditionalInfoPage> {
   final List<String> plan1 = [
    "FSD",
    'LHR',
    "ISB",
    "KR",
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Stack(
            children: [
              
              Container(
                height: 23.h,
                
                child: Image.asset("assets/images/join.png",fit: BoxFit.fill,)),
                Positioned.fill(child: SafeArea(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: text_widget("Please Fill-up the for form\nto complete the sign up.",
                      color: Colors.white,
                      fontSize: 18.5.sp,
                      fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ))
            ],
          ),
          SizedBox(height: 4.h),
          Expanded(child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:22.0,vertical: 0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Center(child: Image.asset("assets/icons/dp.png",height: 10.h,)),
                  SizedBox(height: 3.h),
                     textFieldWithPrefixSuffuxIconAndHintText("Enter Name",radius: 34,

                                fillColor: Color(0xffF8F8F8),
                                bColor: Color(0xffE8ECF4),
                                hintColor: Color(0xff000000).withOpacity(0.40),
                                isPrefix: true,
                                prefixIcon: "assets/icons/user.png"
                              
                              
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
                                prefixIcon: "assets/icons/mail.png"
                              
                              
                                ),
                                SizedBox(height: 2.h),
                            DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Image.asset("assets/icons/city.png",height: 2.5.h,color: MyColors.primary),
                          SizedBox(width: 3.w),
                          Text(
                          selectedValue ?? "Choose Agent",
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 14.4.sp,
                                fontWeight: selectedValue==null? FontWeight.w400:FontWeight.w600,
                                color:selectedValue==null? Colors.black54:Colors.black),
                          ),
                        ],
                      ),
                      items: plan1
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ))
                          .toList(),
                      // value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        decoration: BoxDecoration(
                            color: Color(0xffF7F7F7),
                            borderRadius: BorderRadius.circular(28)),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 6.h,
                        width: 100.w,
                      ),
                      
                      iconStyleData: IconStyleData(
                          icon: Icon(
                        Remix.arrow_down_s_line,
                        size: 2.5.h,
                      )),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                                SizedBox(height: 2.h),
                  
                    textFieldWithPrefixSuffuxIconAndHintText("Enter complete address",radius: 34,
                                fillColor: Color(0xffF8F8F8),
                                bColor: Color(0xffE8ECF4),
                                hintColor: Color(0xff000000).withOpacity(0.40),
                                isPrefix: true,
                                prefixIcon: "assets/icons/address.png",
                                line: 5
                                ),
                                SizedBox(height: 4.h),
                                gradientButton("Complete Sign Up",
                                  font: 15.6,
                                  txtColor: MyColors.white,
                                  ontap: () {
                                   Get.to(UserDrawer());
             
                                  },
                                  // booking nai ki?? ye static request kyun hein??
                                  width: 90,
                                  height: 6,
                                  isColor: true,
                                  clr: MyColors.primary),

SizedBox(height: 10.h),

                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}