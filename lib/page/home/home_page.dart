import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/blocs/conversation/conversation_bloc.dart';
import 'package:wasteapp/blocs/conversation/conversation_event.dart';
import 'package:wasteapp/blocs/conversation/conversation_state.dart';
import 'package:wasteapp/blocs/message/mesaage_bloc.dart';
import 'package:wasteapp/blocs/message/message_event.dart';
import 'package:wasteapp/config/colors.dart';
import 'package:wasteapp/page/home/alert_page.dart';
import 'package:wasteapp/page/home/chat/inbox_screen.dart';
import 'package:wasteapp/page/home/components/picking_time_widget.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/page/home/notificaton_page.dart';
import 'package:wasteapp/page/home/pickup_page.dart';
import 'package:wasteapp/page/home/special_request.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void triggerConversationEvent() {
    context.read<ConversationBloc>().add(ConversationEventCreateOrFetch());
  }

  @override
  void initState() {
    super.initState();
    triggerConversationEvent();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConversationBloc, ConversationState>(
      listener: (context, state) {
        if (state is ConversationStateCreatedOrFetchedExisted) {
          context.read<MessageBloc>().add(MessageEventFetch());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.find<MyDrawerController>().toggleDrawer();
                        },
                        child:
                            Image.asset("assets/icons/draw.png", height: 1.8.h),
                      ),
                      Spacer(),
                      // InkWell(
                      //   onTap: () {
                      //     NavigationService.go(
                      //       NotificationScreen(
                      //         isDrawer: false,
                      //       ),
                      //     );
                      //   },
                      //   child: Image.asset(
                      //     "assets/icons/bell2.png",
                      //     height: 4.2.h,
                      //   ),
                      // ),
                      // SizedBox(width: 2.w),
                      Image.asset(
                        "assets/icons/ll.png",
                        height: 4.0.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  InkWell(
                    onTap: () {
                      // NavigationService.go(PickupPage());
                    },
                    child: PickingTimeWidget(),
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {
                      NavigationService.go(AlertPage());
                    },
                    child: Container(
                      height: 8.4.h,
                      decoration: BoxDecoration(
                        color: Color(0xffE8A04C),
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 5.w),
                          Image.asset("assets/icons/bell1.png", height: 4.h),
                          SizedBox(width: 4.w),
                          textWidget(
                            "Alerts",
                            color: Color(0xff761E37),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          Spacer(),
                          Container(
                            // width: 10.w,
                            height: 2.8.h,
                            decoration: BoxDecoration(
                              color: MyColors.primary,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22.0, vertical: 2),
                              child: Center(
                                child: textWidget("10 Minutes",
                                    fontSize: 11.3.sp, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    height: 10.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              NavigationService.go(SpecialRequestPage());
                            },
                            child: Container(
                              height: 10.h,
                              decoration: BoxDecoration(
                                color: MyColors.primary.withOpacity(0.14),
                                borderRadius: BorderRadius.circular(21),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Spacer(),
                                  Image.asset(
                                    "assets/icons/req.png",
                                    height: 3.3.h,
                                  ),
                                  SizedBox(width: 3.w),
                                  textWidget(
                                    "Special\nRequests",
                                    fontSize: 16.sp,
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              NavigationService.go(InboxScreen());
                            },
                            child: Container(
                              height: 10.h,
                              decoration: BoxDecoration(
                                color: MyColors.primary.withOpacity(0.14),
                                borderRadius: BorderRadius.circular(21),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Spacer(),
                                  Image.asset(
                                    "assets/icons/send.png",
                                    height: 4.h,
                                  ),
                                  SizedBox(width: 3.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      textWidget(
                                        "Chats",
                                        fontSize: 16.sp,
                                      ),
                                      // SizedBox(height: 0.3.h),
                                      // textWidget(
                                      //   "2 New Chats",
                                      //   color: MyColors.primary,
                                      //   fontSize: 13.sp,
                                      // ),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffD6563D).withOpacity(0.14),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/icons/rule.png",
                                  height: 2.8.h),
                              SizedBox(width: 3.w),
                              textWidget("Rules & Guidelines", fontSize: 16.sp),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Divider(
                            color: Color(0xff761E37),
                            thickness: 0.2.w,
                          ),
                          SizedBox(height: 1.7.h),
                          textWidget(
                            "Rule #1:",
                            fontSize: 14.5.sp,
                            color: Color(0xffD45640),
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 0.4.h),
                          textWidget(
                            "ichard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,",
                            fontSize: 13.6.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 1.7.h),
                          textWidget(
                            "Rule #2:",
                            fontSize: 14.5.sp,
                            color: Color(0xffD45640),
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 0.4.h),
                          textWidget(
                            "ichard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,",
                            fontSize: 13.6.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 1.7.h),
                          textWidget(
                            "Rule #3:",
                            fontSize: 14.5.sp,
                            color: Color(0xffD45640),
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 0.4.h),
                          textWidget(
                            "ichard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,",
                            fontSize: 13.6.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 1.7.h),
                          textWidget(
                            "Rule #4:",
                            fontSize: 14.5.sp,
                            color: Color(0xffD45640),
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 0.4.h),
                          textWidget(
                            "ichard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,",
                            fontSize: 13.6.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
