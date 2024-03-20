import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/repos/picking_repo.dart';
import 'package:wasteapp/services/local_notification_services.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
import '../../utilities/extensions/navigation_service.dart';
import '../../widgets/custom_button.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  final List<String> plan1 = [
    "Opening",
    'Sun Rise',
    "Beep",
    "Bounce",
  ];
  String? selectedValue;
  DateTime alarmTime = DateTime.now();
  DateTime? selectedTime;
  String dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());

  void updateTime() {
    final pickingTime = PickingRepo().timeModel?.pickingTime ?? DateTime.now();
    alarmTime = pickingTime.add(Duration(
      minutes: -(selectedTime?.minute ?? 0),
      hours: -(selectedTime?.hour ?? 0),
    ));
    debugPrint(alarmTime.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        NavigationService.back();
                      },
                      child: Icon(
                        Remix.arrow_left_s_line,
                        size: 4.h,
                      ),
                    ),
                    Spacer(),
                    textWidget("Alerts",
                        fontSize: 19.sp, fontWeight: FontWeight.w700)
                  ],
                ),
                SizedBox(height: 8.h),
                Center(
                    child: Image.asset(
                  "assets/icons/bell3.png",
                  height: 8.h,
                )),
                SizedBox(height: 6.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(
                        "Set the Alert timing before the pickup",
                        fontSize: 16.5.sp,
                      ),
                      SizedBox(height: 3.h),
                      timeWidget(
                        onTimeChange: (time) {
                          selectedTime = time;
                        },
                      ),
                      // SizedBox(height: 5.h),
                      // textWidget(
                      //   "Set Tune",
                      //   color: Color(0xff761E37),
                      // ),
                      // SizedBox(height: 2.h),
                      // DropdownButtonHideUnderline(
                      //   child: DropdownButton2<String>(
                      //     isExpanded: true,
                      //     hint: Row(
                      //       children: [
                      //         Text(
                      //           selectedValue ?? "Choose Sound",
                      //           style: GoogleFonts.plusJakartaSans(
                      //               fontSize: 14.4.sp,
                      //               fontWeight: FontWeight.w600,
                      //               color: Color(0xffE8A04C)),
                      //         ),
                      //       ],
                      //     ),
                      //     items: plan1
                      //         .map(
                      //           (String item) => DropdownMenuItem<String>(
                      //             value: item,
                      //             child: Text(
                      //               item,
                      //               style: GoogleFonts.plusJakartaSans(
                      //                 fontSize: 14.sp,
                      //               ),
                      //             ),
                      //           ),
                      //         )
                      //         .toList(),
                      //     // value: selectedValue,
                      //     onChanged: (String? value) {
                      //       setState(() {
                      //         selectedValue = value;
                      //       });
                      //     },
                      //     buttonStyleData: ButtonStyleData(
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Color(0xffD7D7D7)),
                      //         borderRadius: BorderRadius.circular(28),
                      //       ),
                      //       padding: EdgeInsets.symmetric(horizontal: 20),
                      //       height: 6.h,
                      //       width: 100.w,
                      //     ),

                      //     iconStyleData: IconStyleData(
                      //         icon: Icon(
                      //       Remix.arrow_down_s_line,
                      //       size: 2.5.h,
                      //     )),
                      //     menuItemStyleData: const MenuItemStyleData(
                      //       height: 40,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 8.h),
                      gradientButton(
                        "Reset",
                        font: 15.6,
                        txtColor: MyColors.white,
                        ontap: () {
                          updateTime();
                          LocalNotificationServices()
                              .scheduleAlertAlarmNotification(alarmTime);
                        },
                        width: 90,
                        height: 6,
                        isColor: true,
                        clr: MyColors.primary,
                      ),

// SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget timeWidget({required Function(DateTime) onTimeChange}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffD6563D).withOpacity(0.14),
        borderRadius: BorderRadius.circular(21),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 1.h),
            TimePickerSpinner(
              spacing: 4.h,
              itemHeight: 4.h,
              time: DateTime(DateTime.now().year, 1, 1, 0, 15),
              highlightedTextStyle: GoogleFonts.plusJakartaSans(
                color: Color(0xffD6563D),
                fontSize: 21.sp,
                fontWeight: FontWeight.bold,
              ),
              normalTextStyle: GoogleFonts.plusJakartaSans(
                color: Color(0xffD6563D).withOpacity(0.4),
                fontSize: 21.sp,
                fontWeight: FontWeight.w800,
              ),
              is24HourMode: true,
              isForce2Digits: true,
              onTimeChange: (time) => onTimeChange(time),
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Spacer(),
                textWidget(
                  "hrs",
                  color: Color(0xffE8A04C),
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: 12.w),
                textWidget(
                  "mins",
                  color: Color(0xffE8A04C),
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }
}
