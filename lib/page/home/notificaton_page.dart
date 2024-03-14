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
class NotificationScreen extends StatefulWidget {
  final bool isDrawer;
  const NotificationScreen({super.key,required this.isDrawer});

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
            padding: const EdgeInsets.symmetric(horizontal:22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Row(
                    children: [
                   widget.isDrawer?  InkWell(
                      onTap: (){
                        Get.find<MyDrawerController>().toggleDrawer();
                      },
                      child: Image.asset("assets/icons/draw.png",height: 1.8.h)):    InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Remix.arrow_left_s_line,
                        size: 4.h,
                        
                        ),
                      ),
                      Spacer(),
                      text_widget("Notification",
                      fontSize:  17.5.sp,
                      fontWeight: FontWeight.w700
                      )
                    ],
                  ),
                  SizedBox(height: 2.h),
               ...List.generate(6, (index) =>  Padding(
                 padding: const EdgeInsets.symmetric(vertical:8.0),
                 child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: text_widget("Notification Heading",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top:6.0),
                          child: text_widget("Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                          color: Color(0xff8F8F8F),
                          fontSize: 14.sp,
                          
                          ),
                        ),
                      ),
                    ),
                  ),
               ),)
              ]),
          ))));
  }
}