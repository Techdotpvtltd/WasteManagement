import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/blocs/request/request_bloc.dart';
import 'package:wasteapp/blocs/request/request_event.dart';
import 'package:wasteapp/blocs/request/request_state.dart';
import 'package:wasteapp/utilities/dialogs/dialogs.dart';
import 'package:wasteapp/widgets/txt_field.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
import '../../utilities/extensions/navigation_service.dart';
import '../../widgets/custom_button.dart';

class CreateRequestPage extends StatefulWidget {
  const CreateRequestPage({super.key});

  @override
  State<CreateRequestPage> createState() => _CreateRequestPageState();
}

class _CreateRequestPageState extends State<CreateRequestPage> {
  bool isLoading = false;
  String loadingText = "Sending Request";
  final TextEditingController controller = TextEditingController();

  void triggerSendRequestEvent(RequestBloc bloc) {
    bloc.add(
      RequestEventSend(requestMessage: controller.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestBloc, RequestState>(
      listener: (context, state) {
        if (state is RequestStateSending ||
            state is RequestStateSendingFailure ||
            state is RequestStateSent) {
          setState(() {
            isLoading = state.isLoading;
          });

          if (state is RequestStateSendingFailure) {
            CustomDilaogs().errorBox(message: state.exception.message);
          }

          if (state is RequestStateSent) {
            CustomDilaogs().successBox(
              message:
                  "Your request has been noted, and we will respond to you shortly.",
              title: "Request Sent!",
              positiveTitle: "Go to Home",
              onPositivePressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
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
                      textWidget(
                        "Special Requests",
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Image.asset(
                      "assets/icons/req.png",
                      height: 8.h,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  textWidget(
                    "Create a New Special Request ",
                    fontSize: 16.sp,
                    color: Color(0xff761E37),
                  ),
                  SizedBox(height: 3.h),
                  textFieldWithPrefixSuffuxIconAndHintText(
                    "Write your special request here..",
                    radius: 34,
                    controller: controller,
                    fillColor: Color(0xffF8F8F8),
                    bColor: Color(0xffE8ECF4),
                    hintColor: Color(0xff000000).withOpacity(0.40),
                    isPrefix: false,
                    line: 6,
                    prefixIcon: "assets/icons/lock.png",
                  ),
                  SizedBox(height: 6.h),
                  gradientButton(
                    isLoading ? loadingText : "Send",
                    font: 15.6,
                    isLoading: isLoading,
                    txtColor: MyColors.white,
                    ontap: () =>
                        triggerSendRequestEvent(context.read<RequestBloc>()),
                    // booking nai ki?? ye static request kyun hein??
                    width: 90,
                    height: 6,
                    isColor: true,
                    clr: MyColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
