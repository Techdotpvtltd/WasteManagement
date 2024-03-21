import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/blocs/request/request_bloc.dart';
import 'package:wasteapp/blocs/request/request_event.dart';
import 'package:wasteapp/blocs/request/request_state.dart';
import 'package:wasteapp/models/request_model.dart';
import 'package:wasteapp/page/home/create_request.dart';
import 'package:wasteapp/page/home/view_request.dart';
import 'package:wasteapp/utilities/extensions/navigation_service.dart';
import 'package:wasteapp/widgets/txt_widget.dart';

import '../../config/colors.dart';

class SpecialRequestPage extends StatefulWidget {
  const SpecialRequestPage({super.key});

  @override
  State<SpecialRequestPage> createState() => _SpecialRequestPageState();
}

class _SpecialRequestPageState extends State<SpecialRequestPage> {
  List<RequestModel> requests = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    context.read<RequestBloc>().add(RequestEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestBloc, RequestState>(
      listener: (context, state) {
        if (state is RequestStateFetching ||
            state is RequestStateFetchFailure ||
            state is RequestStateFetched) {
          setState(() {
            isLoading = state.isLoading;
          });

          if (state is RequestStateFetched) {
            setState(() {
              requests = state.requests;
            });
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Navigation Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    textWidget(
                      "Special Requests",
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),

                // Create Widgets
                Expanded(
                  flex: (isLoading || requests.isNotEmpty) ? 0 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isLoading || requests.isNotEmpty)
                        SizedBox(height: 8.h),
                      Image.asset(
                        "assets/icons/req.png",
                        height: 8.h,
                      ),
                      SizedBox(height: 3.h),
                      DottedBorder(
                        dashPattern: const [8, 4],
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                        borderType: BorderType.RRect,
                        color: Color(0xff761E37),
                        radius: Radius.circular(21),
                        child: InkWell(
                          onTap: () {
                            NavigationService.go(CreateRequestPage());
                          },
                          child: SizedBox(
                            height: 7.4.h,
                            width: 100.w,
                            child: Center(
                              child: textWidget(
                                "+ Create a New Special Request ",
                                fontSize: 16.sp,
                                color: Color(0xff761E37),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // List Widget
                if (requests.isNotEmpty)
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 3.h),
                        Row(
                          children: [
                            textWidget("Previous Requests",
                                color: Color(0xff761E37)),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Expanded(
                          child: ListView.builder(
                            itemCount: requests.length,
                            itemBuilder: (context, index) {
                              bool isReponseAdded =
                                  requests[index].responser != null;
                              final RequestModel request = requests[index];

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: !isReponseAdded
                                        ? Color(0xffEFEFEF)
                                        : Color(0xffFCF3F1),
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ListTile(
                                      titleAlignment:
                                          ListTileTitleAlignment.top,
                                      leading: Image.asset(
                                          "assets/icons/req.png",
                                          height: 3.h),
                                      title: textWidget(
                                        DateFormat("dd-MMM-yy hh:mm a").format(
                                            request.requester.requestTime),
                                        color: !isReponseAdded
                                            ? Color(0xff515151)
                                            : MyColors.primary,
                                        fontSize: 14.5.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textWidget(
                                            request.requester.request,
                                            color: !isReponseAdded
                                                ? Color(0xff515151)
                                                : Color(0xff761E37),
                                            fontSize: 14.5.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          SizedBox(height: 1.2.h),
                                          Row(
                                            children: [
                                              Spacer(),
                                              isReponseAdded
                                                  ? InkWell(
                                                      onTap: () {
                                                        NavigationService.go(
                                                          ViewRequestPage(
                                                              request: request),
                                                        );
                                                      },
                                                      child: Container(
                                                        height: 4.5.h,
                                                        width: 35.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffD45640),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(40),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                                width: 3.5.w),
                                                            textWidget(
                                                              "View Response",
                                                              fontSize: 13.sp,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Spacer(),
                                                            CircleAvatar(
                                                              radius: 2.2.h,
                                                              backgroundColor:
                                                                  Color(
                                                                      0xff761E37),
                                                              child:
                                                                  Image.asset(
                                                                "assets/icons/arr1.png",
                                                                height: 1.8.h,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 4.6.h,
                                                      width: 15.4.h,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff898989),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(21),
                                                      ),
                                                      child: Center(
                                                        child: textWidget(
                                                          "Waiting For Response",
                                                          fontSize: 12.6.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          SizedBox(height: 1.2.h),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                if (isLoading)
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: MyColors.primary,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
