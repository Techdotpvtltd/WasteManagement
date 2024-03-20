import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/blocs/auth/auth_bloc.dart';
import 'package:wasteapp/blocs/auth/auth_event.dart';
import 'package:wasteapp/blocs/user/user_bloc.dart';
import 'package:wasteapp/blocs/user/user_state.dart';
import 'package:wasteapp/config/colors.dart';
import 'package:wasteapp/models/user_model.dart';
import 'package:wasteapp/page/auth/change_password.dart';
import 'package:wasteapp/page/home/edit_profile.dart';
import 'package:wasteapp/page/home/give_review.dart';
import 'package:wasteapp/page/home/home_page.dart';
import 'package:wasteapp/page/home/notificaton_page.dart';
import 'package:wasteapp/page/home/support_page.dart';
import 'package:wasteapp/page/home/terms_page.dart';
import 'package:wasteapp/repos/user_repo.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';
import 'package:wasteapp/widgets/circle_network_image_widget.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

List titles = [
  "Home",
  "Contact Support",

  "Edit Profile",
  "Terms & Conditions",
  "Change Password",
  "Feedback",
  "Notification",

  // "Setting",
];

List images = [
  "assets/icons/d1.png",
  "assets/icons/d2.png",
  "assets/icons/d3.png",
  "assets/icons/d4.png",
  "assets/icons/d5.png",
  "assets/icons/d6.png",
  "assets/icons/d7.png",
];

class UserDrawer extends StatefulWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  int currentIndex = -1;

  void triggerLoginEvent(AuthBloc bloc) {
    bloc.add(AuthEventPerformLogout());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      init: MyDrawerController(),
      builder: (MyDrawerController _) => Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/dr.png")),
          Positioned.fill(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Builder(
                builder: (context) {
                  return Stack(
                    children: [
                      ZoomDrawer(
                          disableDragGesture: true,
                          shadowLayer1Color: MyColors.white.withOpacity(0.0),
                          shadowLayer2Color: MyColors.white.withOpacity(0.3),
                          controller: _.zoomDrawerController,
                          menuScreen: DrawerScreen(setIndex: (index) {
                            setState(() {
                              currentIndex = index;
                              _.open = false;
                            });
                          }),
                          mainScreen: Builder(builder: (context) {
                            return currentScreen();
                          }),
                          borderRadius: 30,
                          showShadow: true,
                          angle: -7.0,
                          slideWidth: 290,
                          menuBackgroundColor: Colors.transparent),
                      _.open
                          ? Positioned.fill(
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              _.closeDrawer();
                                            },
                                            child: const Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                      SizedBox(height: 2.h),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: BlocSelector<UserBloc, UserState,
                                            UserModel?>(
                                          selector: (state) {
                                            if (state
                                                is UserStateProfileUpdated) {
                                              return state.user;
                                            }
                                            return null;
                                          },
                                          builder: (context, statedUser) {
                                            final UserModel user =
                                                UserRepo().currentUser;
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CircleNetworkImage(
                                                  url: statedUser?.avatar ??
                                                      user.avatar,
                                                  width: 80,
                                                  height: 80,
                                                  backgroundColor: Colors.black,
                                                  onTapImage: () {
                                                    NavigationService.go(
                                                        EditProfile(
                                                      showBack: true,
                                                    ));
                                                    _.closeDrawer();
                                                  },
                                                ),
                                                SizedBox(height: 1.h),
                                                textWidget("Hey, 👋",
                                                    color: Colors.white,
                                                    fontSize: 16.sp),
                                                SizedBox(height: 1.h),
                                                textWidget(
                                                    (statedUser ?? user).name,
                                                    fontSize: 15.5.sp,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600)
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      _.open
                          ? Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: SafeArea(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 38.0, vertical: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            triggerLoginEvent(
                                                context.read<AuthBloc>());
                                          },
                                          child: Container(
                                            width: 40.w,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                              color: MyColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Center(
                                              child: textWidget(
                                                "Logout",
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget currentScreen() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return CustomerSupport();
      case 2:
        return EditProfile();

      case 3:
        return TermsPage();
      case 4:
        return ChangePassword();
      case 5:
        return GiveReview(
          isDrawer: true,
          requestId: "",
        );
      case 6:
        return NotificationScreen(
          isDrawer: true,
        );

      default:
        return HomePage();
    }
  }
}

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex;
  const DrawerScreen({Key? key, required this.setIndex}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      init: MyDrawerController(),
      builder: (MyDrawerController _) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 68.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 40.w,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: titles.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    widget.setIndex(index);
                                    _.active = index;
                                    _.update();
                                    log(
                                      _.active.toString(),
                                    );

                                    ZoomDrawer.of(context)!.close();
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6.0,
                                ),
                                child: Container(
                                  height: 4.6.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: _.active == index
                                        ? Color(0xffFFFFFF)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 4.w),
                                      Image.asset(
                                        images[index],
                                        height: 2.2.h,
                                        color: _.active == index
                                            ? MyColors.primary
                                            : Colors.white,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        titles[index],
                                        style: GoogleFonts.plusJakartaSans(
                                          color: _.active == index
                                              ? MyColors.primary
                                              : MyColors.white,
                                          fontSize: 13.4.sp,
                                          fontWeight: _.active == index
                                              ? FontWeight.w600
                                              : FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  bool open = false;
  void toggleDrawer() {
    debugPrint("Toggle drawer");
    Timer(const Duration(microseconds: 30), () {
      open = true;

      update();
    });
    zoomDrawerController.toggle?.call();
    update();
  }

  int active = 0;

  void closeDrawer() {
    debugPrint("Close drawer");
    Timer(const Duration(microseconds: 800), () {
      open = false;

      update();
    });
    zoomDrawerController.close?.call();
    update();
  }
}
