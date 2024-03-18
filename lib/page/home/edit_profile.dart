import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:place_picker/place_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/blocs/user/user_bloc.dart';
import 'package:wasteapp/blocs/user/user_event.dart';
import 'package:wasteapp/blocs/user/user_state.dart';
import 'package:wasteapp/models/user_model.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/repos/user_repo.dart';
import 'package:wasteapp/utilities/dialogs/dialogs.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';
import 'package:wasteapp/widgets/avatar_widget.dart';
import 'package:wasteapp/widgets/txt_field.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
import '../../widgets/custom_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserLocation? userLocation;
  String? selctedAvatar;
  bool isLoading = false;
  String loadingText = "Loading...";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void triggerUpdateProfileEvent(UserBloc bloc) {
    bloc.add(UserEventUpdateProfile(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      location: userLocation,
      avatarUrl: selctedAvatar,
    ));
  }

  @override
  void initState() {
    super.initState();
    if (!UserRepo().isUserNull) {
      final UserModel user = UserRepo().currentUser;
      selctedAvatar = user.avatar;
      nameController.text = user.name;
      phoneController.text = user.phoneNumber;
      emailController.text = user.email;
      addressController.text = user.location?.address ?? "";
      userLocation = user.location;
      selctedAvatar = user.avatar;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserStateAvatarUploading ||
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

          if (state is UserStateProfileUpdated) {
            CustomDilaogs()
                .successBox(message: "Profiled updated.", title: "Congrats");
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
                          Get.find<MyDrawerController>().toggleDrawer();
                        },
                        child: Image.asset(
                          "assets/icons/draw.png",
                          height: 1.8.h,
                        ),
                      ),
                      Spacer(),
                      textWidget(
                        "Edit Profile",
                        fontSize: 17.5.sp,
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: AvatarWidget(
                      avatarUrl: selctedAvatar,
                      onSelectedImage: (imagePath) {
                        selctedAvatar = imagePath;
                      },
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
                    isSuffix: true,
                    suffixIcon: 'assets/icons/pen.png',
                  ),
                  SizedBox(height: 2.h),
                  textFieldWithPrefixSuffuxIconAndHintText(
                    "Enter Phone Number",
                    controller: phoneController,
                    radius: 34,
                    fillColor: Color(0xffF8F8F8),
                    bColor: Color(0xffE8ECF4),
                    hintColor: Color(0xff000000).withOpacity(0.40),
                    isPrefix: true,
                    prefixIcon: "assets/icons/phone.png",
                    isSuffix: true,
                    suffixIcon: 'assets/icons/pen.png',
                  ),
                  SizedBox(height: 2.h),
                  textFieldWithPrefixSuffuxIconAndHintText(
                    "Enter Email",
                    controller: emailController,
                    radius: 34,
                    fillColor: Color(0xffF8F8F8),
                    bColor: Color(0xffE8ECF4),
                    hintColor: Color(0xff000000).withOpacity(0.40),
                    isPrefix: true,
                    prefixIcon: "assets/icons/mail.png",
                    isSuffix: true,
                    suffixIcon: 'assets/icons/pen.png',
                  ),
                  SizedBox(height: 2.h),
                  textFieldWithPrefixSuffuxIconAndHintText(
                    "Address",
                    controller: addressController,
                    radius: 34,
                    fillColor: Color(0xffF8F8F8),
                    bColor: Color(0xffE8ECF4),
                    hintColor: Color(0xff000000).withOpacity(0.40),
                    isPrefix: true,
                    prefixIcon: "assets/icons/pp.png",
                    onTap: () async {
                      // Await for permission
                      LocationPermission status =
                          await Geolocator.checkPermission();
                      if (status == LocationPermission.denied) {
                        status = await Geolocator.requestPermission();
                      }

                      if (status == LocationPermission.denied ||
                          status == LocationPermission.deniedForever) {
                        CustomDilaogs().alertBox(
                            message:
                                "Please allow location permission from settings.",
                            title: "Location Permission Denied.",
                            positiveTitle: "Okay",
                            showNegative: false);
                        return;
                      }

                      final LocationResult result = await NavigationService.go(
                        PlacePicker(
                          "AIzaSyCtEDCykUDeCa7QkT-LK63xQ7msSXNZoq0",
                          defaultLocation: LatLng(
                            userLocation?.latitude ?? 0,
                            userLocation?.longitude ?? 0,
                          ),
                        ),
                      );
                      setState(() {
                        addressController.text = result.formattedAddress ?? "";
                      });
                      userLocation = UserLocation(
                          address: result.formattedAddress,
                          city: result.city?.name,
                          country: result.country?.name,
                          latitude: result.latLng?.latitude,
                          longitude: result.latLng?.longitude);
                    },
                  ),
                  SizedBox(height: 4.h),
                  gradientButton(
                    isLoading ? loadingText : "Save",
                    font: 15.6,
                    isLoading: isLoading,
                    txtColor: MyColors.white,
                    ontap: () {
                      triggerUpdateProfileEvent(context.read<UserBloc>());
                    },
                    width: 90,
                    height: 6,
                    isColor: true,
                    clr: MyColors.primary,
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
