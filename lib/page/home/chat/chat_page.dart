import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/home/chat/bubble.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

class UserChatPage extends StatefulWidget {
  // final bool isService;

  const UserChatPage({
    super.key,
  });
  @override
  UserChatPageState createState() => UserChatPageState();
}

class UserChatPageState extends State<UserChatPage> {
  TextEditingController cont = TextEditingController();

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            bottomNavigationBar:
                _buildMessageComposer(controller: cont, context),
            body: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
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
                        Image.asset(
                          "assets/icons/send.png",
                          height: 4.h,
                        ),
                        SizedBox(width: 1.5.w),
                        textWidget(
                          "Chats",
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w700,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: _messagesWithUserInfo(
                      context,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
  Widget _messagesWithUserInfo(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // isService?    serviceWidget(context,isPrice: false,isEdit: false):SizedBox(),
            SizedBox(height: 3.h),
            textWidget("Today", fontSize: 15.sp),
            _buildContainer(context)
          ],
        ),
      );

  Widget _buildContainer(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.only(top: 18),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: _messagesList(context),
        ),
      );

  Widget _messagesList(BuildContext context) => ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) => BubbleWidget(
            index == 1 || index == 3 || index == 6, index,
            voice: index == 4 || index == 5),
      );
}

_buildMessageComposer(context, {controller}) {
  return Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: SafeArea(
      top: false,
      child: SizedBox(
        width: 100.w,
        child: Row(
          children: [
            SizedBox(width: 3.w),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextField(
                  style:
                      GoogleFonts.roboto(fontSize: 16.sp, color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    prefixIconConstraints: BoxConstraints(minWidth: 12.w),
                    prefixIcon: Image.asset(
                      "assets/icons/att.png",
                      height: 3.h,
                    ),
                    hintText: "Message....",
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.black54, fontSize: 15.sp),
                  ),
                ),
              ),
            ),
            SizedBox(width: 3.w)
          ],
        ),
      ),
    ),
  );
}
