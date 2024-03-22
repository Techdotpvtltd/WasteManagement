import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/blocs/message/mesaage_bloc.dart';
import 'package:wasteapp/blocs/message/message_event.dart';
import 'package:wasteapp/blocs/message/message_state.dart';
import 'package:wasteapp/config/colors.dart';
import 'package:wasteapp/models/message_model.dart';
import 'package:wasteapp/widgets/my_image_picker.dart';

import '../../../utilities/constants/constants.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/txt_widget.dart';
import 'bubble_widget.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final TextEditingController messageController = TextEditingController();

  void triggerSenderMediaMessageEvent(
      {required String fileUrl, required String contentType}) {
    context
        .read<MessageBloc>()
        .add(MessageEventSend(content: fileUrl, type: MessageType.photo));
  }

  void onMediaPressed() {
    final MyImagePicker imagePicker = MyImagePicker();
    imagePicker.pick();
    imagePicker.onSelection((exception, data) {
      if (data is XFile) {
        triggerSenderMediaMessageEvent(
            fileUrl: data.path, contentType: "image/jpeg");
      }
    });
  }

  void triggerSenderMessageEvent() {
    context.read<MessageBloc>().add(MessageEventSend(
        content: messageController.text, type: MessageType.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessageBloc, MessageState>(
      listener: (context, state) {
        if (state is MessageStateSent ||
            state is MessageStateSending ||
            state is MessageStateSendFailure) {
          messageController.clear();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: CustomAppBar(
            title: "",
            titleSpace: 10,
            actions: <Widget>[
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 23),
          child: Column(
            children: <Widget>[
              Expanded(
                child: BubbleWidget(),
              ),
              gapH10,
              MessageTextField(
                messageController: messageController,
                onMediaPickerPressed: () {
                  onMediaPressed();
                },
                onSendPressed: () {
                  triggerSenderMessageEvent();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageTextField extends StatelessWidget {
  const MessageTextField(
      {super.key,
      required this.messageController,
      required this.onSendPressed,
      required this.onMediaPickerPressed});
  final TextEditingController messageController;
  final VoidCallback onSendPressed;
  final VoidCallback onMediaPickerPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        maxLines: 6,
        minLines: 1,
        controller: messageController,
        clipBehavior: Clip.hardEdge,
        style: GoogleFonts.plusJakartaSans(
          color: const Color(0xFF2C2C2C),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFECEBEB),
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(54)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFECEBEB),
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(54)),
          ),
          hintText: "Send a message",
          hintStyle: GoogleFonts.plusJakartaSans(
            color: const Color(0xFFBFBFBF),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: InkWell(
            onTap: () {
              onMediaPickerPressed();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: SvgPicture.asset("assets/icons/clip_board_ic.svg"),
            ),
          ),
          suffixIcon: InkWell(
            onTap: () {
              onSendPressed();
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                Icons.send,
                color: MyColors.primary3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
