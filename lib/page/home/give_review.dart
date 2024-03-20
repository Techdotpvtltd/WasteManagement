import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/page/auth/done_review.dart';
import 'package:wasteapp/page/home/drawer.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';
import 'package:wasteapp/widgets/custom_button.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';
import '../../widgets/txt_field.dart';

class GiveReview extends StatefulWidget {
  final bool isDrawer;
  const GiveReview({super.key, required this.isDrawer});

  @override
  State<GiveReview> createState() => _GiveReviewState();
}

class _GiveReviewState extends State<GiveReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: gradientButton("Submit",
            font: 15.6, txtColor: MyColors.white, ontap: () {
          NavigationService.go(DoneReview());
        },
            // booking nai ki?? ye static request kyun hein??
            width: 90,
            height: 6,
            isColor: true,
            clr: MyColors.primary),
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
                        widget.isDrawer
                            ? InkWell(
                                onTap: () {
                                  Get.find<MyDrawerController>().toggleDrawer();
                                },
                                child: Image.asset("assets/icons/draw.png",
                                    height: 1.8.h))
                            : InkWell(
                                onTap: () {
                                  NavigationService.back();
                                },
                                child: Icon(
                                  Remix.arrow_left_s_line,
                                  size: 4.h,
                                ),
                              ),
                        Spacer(),
                        textWidget("Feedback",
                            fontSize: 17.5.sp, fontWeight: FontWeight.w700)
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Center(
                        child: Image.asset(
                      "assets/icons/rev.png",
                      height: 12.h,
                    )),
                    SizedBox(height: 2.h),
                    Center(
                      child: textWidget("Add Review"),
                    ),
                    SizedBox(height: 2.h),
                    Center(
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        unratedColor: Color(0xffBBBBBB),
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          debugPrint(rating.toString());
                        },
                      ),
                    ),
                    SizedBox(height: 2.h),
                    textWidget("Message"),
                    SizedBox(height: 2.h),
                    textFieldWithPrefixSuffuxIconAndHintText(
                      "Type here..",
                      radius: 34,
                      fillColor: Color(0xffF8F8F8),
                      bColor: Color(0xffE8ECF4),
                      hintColor: Color(0xff000000).withOpacity(0.40),
                      isPrefix: false,
                      line: 9,
                      prefixIcon: "assets/icons/lock.png",
                    ),
                  ]),
            ))));
  }
}
