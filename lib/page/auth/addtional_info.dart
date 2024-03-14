import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:wasteapp/blocs/user/user_bloc.dart';
import 'package:wasteapp/blocs/user/user_event.dart';
import 'package:wasteapp/blocs/user/user_state.dart';
import 'package:wasteapp/config/colors.dart';
import 'package:wasteapp/page/auth/login_page.dart';
import 'package:wasteapp/utilities/dialogs/dialogs.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';
import 'package:wasteapp/widgets/circle_network_image_widget.dart';
import 'package:wasteapp/widgets/custom_button.dart';
import 'package:wasteapp/widgets/my_image_picker.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../widgets/txt_field.dart';

class AdditionalInfoPage extends StatefulWidget {
  const AdditionalInfoPage({super.key});

  @override
  State<AdditionalInfoPage> createState() => _AdditionalInfoPageState();
}

class _AdditionalInfoPageState extends State<AdditionalInfoPage> {
  final List<String> plan1 = [
    "FSD",
    'LHR',
    "ISB",
    "KR",
  ];
  String? selectedValue;
  String? selectedAvatar;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String loadingText = "Loading";
  bool isLoading = false;

  void selectImage() {
    final MyImagePicker imagePicker = MyImagePicker();
    imagePicker.pick();
    imagePicker.onSelection(
      (exception, data) {
        if (data is XFile) {
          setState(() {
            selectedAvatar = data.path;
          });
        }
      },
    );
  }

  void triggerUpdateProfileEvent(UserBloc bloc) {
    final user = FirebaseAuth.instance.currentUser;

    bloc.add(
      UserEventUpdateProfile(
        name: nameController.text,
        phone: phoneController.text,
        email: user?.email ?? "",
        address: addressController.text,
        agent: selectedValue ?? "",
        avatarUrl: selectedAvatar,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserStateAvatarUploading ||
            state is UserStatAvatareUploadingFailure ||
            state is UserStateAvatarUploaded ||
            state is UserStateProfileUpdated ||
            state is UserStateProfileUpdating ||
            state is UserStateProfileUpdatingFailure) {
          setState(() {
            isLoading = state.isLoading;
            loadingText = state.loadingText;
          });

          if (state is UserStateProfileUpdatingFailure) {
            CustomDilaogs().errorBox(message: state.exception.message);
          }

          if (state is UserStatAvatareUploadingFailure) {
            CustomDilaogs().errorBox(message: state.exception.message);
          }

          if (state is UserStateProfileUpdated) {
            CustomDilaogs().successBox(
              message:
                  "Your account registration was successful. Kindly log in to begin utilizing the application's features.",
              positiveTitle: "Go to Login",
              onPositivePressed: () {
                NavigationService.offAll(LoginPage());
              },
            );
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
                SizedBox(
                  height: 23.h,
                  child: Image.asset(
                    "assets/images/join.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                    child: SafeArea(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: textWidget(
                        "Please Fill-up the for form\nto complete the sign up.",
                        color: Colors.white,
                        fontSize: 18.5.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ))
              ],
            ),
            SizedBox(height: 4.h),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Positioned(
                            child: CircleNetworkImage(
                              height: 115,
                              width: 115,
                              url: selectedAvatar ?? "",
                              onTapImage: () {
                                selectImage();
                              },
                            ),
                          ),
                          Positioned(
                            right: 5,
                            bottom: 5,
                            child: Icon(
                              Icons.camera_alt,
                              color: MyColors.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 3.h),
                    textFieldWithPrefixSuffuxIconAndHintText(
                      "Enter Name",
                      controller: nameController,
                      radius: 34,
                      fillColor: Color(0xffF8F8F8),
                      bColor: Color(0xffE8ECF4),
                      hintColor: Color(0xff000000).withOpacity(0.40),
                      isPrefix: true,
                      prefixIcon: "assets/icons/user.png",
                    ),
                    SizedBox(height: 2.h),
                    textFieldWithPrefixSuffuxIconAndHintText(
                      "Enter Phone Number",
                      controller: phoneController,
                      radius: 34,
                      keyboardType: TextInputType.phone,
                      fillColor: Color(0xffF8F8F8),
                      bColor: Color(0xffE8ECF4),
                      hintColor: Color(0xff000000).withOpacity(0.40),
                      isPrefix: true,
                      prefixIcon: "assets/icons/phone.png",
                    ),
                    SizedBox(height: 2.h),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Image.asset("assets/icons/city.png",
                                height: 2.5.h, color: MyColors.primary),
                            SizedBox(width: 3.w),
                            Text(
                              selectedValue ?? "Choose Agent",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14.4.sp,
                                fontWeight: selectedValue == null
                                    ? FontWeight.w400
                                    : FontWeight.w600,
                                color: selectedValue == null
                                    ? Colors.black54
                                    : Colors.black,
                              ),
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
                            selectedValue = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                              color: Color(0xffF7F7F7),
                              borderRadius: BorderRadius.circular(28)),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 6.h,
                          width: 100.w,
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
                    SizedBox(height: 2.h),
                    textFieldWithPrefixSuffuxIconAndHintText(
                      "Enter complete address",
                      radius: 34,
                      controller: addressController,
                      fillColor: Color(0xffF8F8F8),
                      bColor: Color(0xffE8ECF4),
                      hintColor: Color(0xff000000).withOpacity(0.40),
                      isPrefix: true,
                      prefixIcon: "assets/icons/address.png",
                      line: 5,
                    ),
                    SizedBox(height: 4.h),
                    gradientButton(
                      isLoading ? loadingText : "Complete Sign Up",
                      isLoading: isLoading,
                      font: 15.6,
                      txtColor: MyColors.white,
                      ontap: () {
                        triggerUpdateProfileEvent(context.read<UserBloc>());
                      },
                      // booking nai ki?? ye static request kyun hein??
                      width: 90,
                      height: 6,
                      isColor: true,
                      clr: MyColors.primary,
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
