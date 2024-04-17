import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../models/terms_model.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  final List<TermsModel> terms = [
    TermsModel(title: "1. App Usage", description: "1.1 The MT Waste App is intended for use by residents of [Specify Location/Area] who are authorized users of our waste management services.\n\n1.2 You must provide accurate and complete information during registration and ensure that your account details (including flat number and contact information) are up-to-date.\n\n1.3 The App is provided on an \"as is\" and \"as available\" basis. We reserve the right to modify, suspend, or discontinue any part of the App at any time without prior notice."),
    TermsModel(title: "2. User Responsibilities", description: "2.1 You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.\n\n2.2 You agree not to use the App for any unlawful purpose or in a way that violates these Terms or infringes upon the rights of others."),
    TermsModel(title: "3. Trash Pickup Services", description: "3.1 The App provides information about scheduled trash pickup times and allows users to submit special requests for additional services.\n\n3.2 We will make reasonable efforts to adhere to the scheduled pickup times and address special requests submitted through the App."),
    TermsModel(title: "4. Special Requests", description: "4.1 Special requests submitted through the App are subject to approval and availability. We reserve the right to deny or modify special requests based on operational constraints."),
    TermsModel(title: "5. Data Privacy", description: "5.1 Your privacy is important to us. Please refer to our Privacy Policy for information on how we collect, use, and disclose your personal data."),
    TermsModel(title: "6. Intellectual Property", description: "6.1 The App and its content, including but not limited to text, graphics, logos, and images, are protected by intellectual property rights owned by us or our licensors."),
    TermsModel(title: "7. Limitation of Liability", description: "7.1 We shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with your use of the App."),
    TermsModel(title: "8. Indemnification", description: "8.1 You agree to indemnify and hold us harmless from any claims, losses, damages, liabilities, and expenses (including legal fees) arising out of or related to your use of the App."),
    TermsModel(title: "9. Governing Law", description: "9.1 These Terms are governed by and construed in accordance with the laws of [Jurisdiction]. Any dispute arising from these Terms shall be subject to the exclusive jurisdiction of the courts of [Jurisdiction]."),
    TermsModel(title: "10. Changes to Terms", description: "10.1 We reserve the right to update or modify these Terms at any time. Changes will be effective immediately upon posting the revised Terms on the App."),
    TermsModel(title: "11. Contact Us", description: "11.1 If you have any questions or concerns about these Terms or the MT Waste App, please contact us at Special Request."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            child: Image.asset("assets/icons/draw.png",
                                height: 1.8.h)),
                        // Spacer(),
                        // text_widget("Forgot Password",
                        // fontSize: 19.sp,
                        // fontWeight: FontWeight.w700
                        // )
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Center(
                        child: Image.asset(
                      "assets/icons/sup.png",
                      height: 13.h,
                    )),
                    SizedBox(height: 2.h),
                    Center(
                      child: textWidget("Terms and Conditions",
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4.h),
                    textWidget(
                        "These terms and conditions (\"Terms\") govern your use of the MT Waste App (the \"App\") provided by MT Waste. (\"we,\" \"us,\" or \"our\"). By accessing or using the App, you agree to comply with these Terms. If you do not agree with these Terms, you may not use the App.",
                        color: Color(0xff1E1E1E),
                        fontSize: 13.8.sp,
                        fontWeight: FontWeight.w400),
                    for(TermsModel model in terms)
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 2.h),
                       textWidget(model.title,
                           fontWeight: FontWeight.w600, fontSize: 16.sp),
                       SizedBox(height: 2.h),
                       textWidget(
                           model.description,
                           color: Color(0xff1E1E1E),
                           fontSize: 13.8.sp,
                           fontWeight: FontWeight.w400),
                     ],
                   )
,                    SizedBox(height: 4.h),

                  ],),
            ),),),);
  }
}
