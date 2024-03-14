import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/blocs/auth/auth_bloc.dart';
import 'package:wasteapp/blocs/auth/auth_event.dart';
import 'package:wasteapp/blocs/auth/auth_state.dart';
import 'package:wasteapp/utilities/dialogs/dialogs.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';
import 'package:wasteapp/widgets/txt_field.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
import '../../widgets/custom_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  String loadingText = "Sending Mail...";
  bool isLoading = false;

  void triggerForgotPassword(AuthBloc bloc) {
    bloc.add(
      AuthEventForgotPassword(email: emailController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateSendingForgotEmail ||
            state is AuthStateSendForgotEmailFailure ||
            state is AuthStateSentForgotEmail) {
          setState(() {
            isLoading = state.isLoading;
          });

          if (state is AuthStateSendForgotEmailFailure) {
            CustomDilaogs().errorBox(message: state.exception.message);
          }

          if (state is AuthStateSentForgotEmail) {
            CustomDilaogs().successBox(
              message:
                  "We've just sent you an email containing a password reset link.\nPlease check your mail.",
              title: "Mail Sent!",
              positiveTitle: "Go back",
              onPositivePressed: () {
                NavigationService.back();
              },
            );
          }
        }
      },
      child: Scaffold(
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
                              NavigationService.back();
                            },
                            child: Icon(
                              Remix.arrow_left_s_line,
                              size: 4.h,
                            ),
                          ),
                          Spacer(),
                          textWidget("Forgot Password",
                              fontSize: 19.sp, fontWeight: FontWeight.w700)
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Center(
                          child: Image.asset(
                        "assets/icons/pass.png",
                        height: 10.h,
                      )),
                      SizedBox(height: 3.h),
                      textFieldWithPrefixSuffuxIconAndHintText(
                        "Enter Email",
                        radius: 34,
                        controller: emailController,
                        fillColor: Color(0xffF8F8F8),
                        bColor: Color(0xffE8ECF4),
                        hintColor: Color(0xff000000).withOpacity(0.40),
                        isPrefix: true,
                        prefixIcon: "assets/icons/mail.png",
                      ),
                      SizedBox(height: 15.h),
                      gradientButton(
                        isLoading ? loadingText : "Reset Password",
                        font: 15.6,
                        txtColor: MyColors.white,
                        ontap: () {
                          triggerForgotPassword(context.read<AuthBloc>());
                        },
                        // booking nai ki?? ye static request kyun hein??
                        width: 90,
                        height: 6,
                        isColor: true,
                        isLoading: isLoading,
                        clr: MyColors.primary,
                      ),
                      SizedBox(height: 10.h),
                    ]),
              )))),
    );
  }
}
