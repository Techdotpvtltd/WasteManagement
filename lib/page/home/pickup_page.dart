import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({super.key});

  @override
  State<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  final List<String> plan1 = [
    "Jan",
    'Feb',
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  String selectedValue = 'Jan';
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
                        textWidget("Pickup",
                            fontSize: 19.sp, fontWeight: FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Center(
                        child: Image.asset(
                      "assets/icons/pick.png",
                      height: 8.h,
                    )),
                    SizedBox(height: 3.h),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 26),
                        child: Row(
                          children: [
                            Image.asset("assets/icons/rec.png", height: 5.h),
                            SizedBox(width: 7.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWidget("Next Pick-up ",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFCF9).withOpacity(0.51),
                                    fontSize: 15.sp),
                                textWidget("9h 43min",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp),
                                textWidget(
                                  "10:43pm ",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFFFCF9).withOpacity(0.51),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        textWidget("Pickup History", color: Color(0xff761E37)),
                        Spacer(),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Text(
                                  selectedValue,
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 14.4.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
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
                                selectedValue = value!;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                                  color: Color(0xffF2F2F2),
                                  borderRadius: BorderRadius.circular(18)),
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              height: 4.h,
                              width: 23.w,
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
                      ],
                    ),
                    SizedBox(height: 3.h),
                    ...List.generate(
                      6,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: index == 2 || index == 4
                                ? Color(0xffEFEFEF)
                                : Color(0xffFCF3F1),
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ListTile(
                              leading: index == 2 || index == 4
                                  ? Image.asset(
                                      "assets/icons/t1.png",
                                      height: 3.4.h,
                                    )
                                  : Image.asset("assets/icons/pick.png",
                                      height: 3.4.h),
                              title: textWidget("10:43pm ",
                                  color: index == 2 || index == 4
                                      ? Color(0xff939393)
                                      : Color(0xff761E37),
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w700),
                              subtitle: textWidget("5 Jan 2024",
                                  color: index == 2 || index == 4
                                      ? Color(0xff939393)
                                      : Color(0xff761E37),
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w700),
                              trailing: index == 2 || index == 4
                                  ? Image.asset(
                                      "assets/icons/close.png",
                                      height: 2.h,
                                    )
                                  : Image.asset(
                                      "assets/icons/done.png",
                                      height: 2.h,
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
