import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/blocs/auth/auth_event.dart';
import 'package:wasteapp/blocs/auth/auth_state.dart';
import 'package:wasteapp/page/auth/forgot_password.dart';
import 'package:wasteapp/page/auth/singup_page.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/utilities/constants/constants.dart';
import 'package:wasteapp/utilities/dialogs/dialogs.dart';
import 'package:wasteapp/utilities/dialogs/loaders.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';
import 'package:wasteapp/widgets/social_icon_button.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../widgets/txt_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void triggerLoginEvent(AuthBloc bloc) {
    bloc.add(
      AuthEventPerformLogin(
          email: emailController.text, password: passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateLogging ||
            state is AuthStateLoggedIn ||
            state is AuthStateLoginFailure ||
            state is AuthStateEmailVerificationRequired ||
            state is AuthStateAppleLoggedIn ||
            state is AuthStateGoogleLoggedIn ||
            state is AuthStateGoogleLogging) {
          state.isLoading
              ? Loader().show(withText: "Login...")
              : NavigationService.back();

          if (state is AuthStateLoginFailure) {
            CustomDilaogs().errorBox(message: state.exception.message);
          }

          if (state is AuthStateEmailVerificationRequired) {
            CustomDilaogs().alertBox(
              message:
                  "Please verify your email by clicking on the link provided in the email we've sent you.",
              title: "Email Verification Required",
            );
          }

          if (state is AuthStateLoggedIn ||
              state is AuthStateAppleLoggedIn ||
              state is AuthStateGoogleLoggedIn) {
            NavigationService.offAll(UserDrawer());
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 25.h,
                ),
                SizedBox(
                  height: 20.h,
                  child: Image.asset(
                    "assets/icons/log1.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/icons/logo.png",
                      height: 16.h,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 4.h),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                      "Welcome Back!",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 3.h),
                    textFieldWithPrefixSuffuxIconAndHintText(
                      "Enter Email",
                      controller: emailController,
                      radius: 34,
                      fillColor: Color(0xffF8F8F8),
                      bColor: Color(0xffE8ECF4),
                      hintColor: Color(0xff000000).withOpacity(0.40),
                      isPrefix: true,
                      prefixIcon: "assets/icons/user.png",
                    ),
                    SizedBox(height: 2.h),
                    textFieldWithPrefixSuffuxIconAndHintText(
                      "Enter Password Here",
                      controller: passwordController,
                      radius: 34,
                      fillColor: Color(0xffF8F8F8),
                      bColor: Color(0xffE8ECF4),
                      hintColor: Color(0xff000000).withOpacity(0.40),
                      isPrefix: true,
                      prefixIcon: "assets/icons/lock.png",
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Spacer(),
                        InkWell(
                          onTap: () {
                            NavigationService.go(ForgotPassword());
                          },
                          child:
                              textWidget("Forgot Password?", fontSize: 14.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Spacer(),
                        InkWell(
                          onTap: () {
                            triggerLoginEvent(context.read<AuthBloc>());
                          },
                          child: Container(
                            height: 5.5.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                color: Color(0xffD45640),
                                borderRadius: BorderRadius.circular(40)),
                            child: Row(
                              children: [
                                SizedBox(width: 3.5.w),
                                textWidget(
                                  "Login",
                                  fontSize: 16.5.sp,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                CircleAvatar(
                                  radius: 2.8.h,
                                  backgroundColor: Color(0xff761E37),
                                  child: Image.asset(
                                    "assets/icons/arr1.png",
                                    height: 1.8.h,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Image.asset("assets/icons/or.png", fit: BoxFit.fill),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIconButton(
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthEventAppleLogin());
                            },
                            icon: "assets/icons/apple-ic.svg"),
                        gapW10,
                        SocialIconButton(
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthEventGoogleLogin());
                            },
                            icon: "assets/icons/google-ic.svg"),
                      ],
                    ),
                    SizedBox(height: 9.h),
                    InkWell(
                      onTap: () {
                        NavigationService.off(SingupPage());
                      },
                      child: Container(
                        width: Get.width,
                        height: 5.8.h,
                        decoration: BoxDecoration(
                            color: Color(0xffF3F3F3),
                            borderRadius: BorderRadius.circular(24)),
                        child: Center(
                          child: Text.rich(
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 15.5.sp, fontWeight: FontWeight.w400),
                            TextSpan(
                              text: 'Don’t have an Account? ',
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Sign Up',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 15.6.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
