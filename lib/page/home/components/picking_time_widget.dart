// ignore: dangling_library_doc_comments
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wasteapp/blocs/picking/picking_bloc.dart';
import 'package:wasteapp/blocs/picking/picking_event.dart';
import 'package:wasteapp/blocs/picking/picking_state.dart';
import 'package:wasteapp/models/picking_time_model.dart';
import 'package:wasteapp/utilities/helping_methods.dart';

import '../../../config/colors.dart';
import '../../../widgets/txt_widget.dart';

/// Project: 	   wasteapp
/// File:    	   picking_time_widget
/// Path:    	   lib/page/home/components/picking_time_widget.dart
/// Author:       Ali Akbar
/// Date:        19-03-24 14:18:17 -- Tuesday
/// Description:
///

class PickingTimeWidget extends StatefulWidget {
  const PickingTimeWidget({super.key, this.showForwardArrow = true});
  final bool showForwardArrow;

  @override
  State<PickingTimeWidget> createState() => _PickingTimeWidgetState();
}

class _PickingTimeWidgetState extends State<PickingTimeWidget> {
  PickingTimeModel? model;
  Timer? timer;
  String? remainingTime;

  void triggerTimer() {
    timer ??= Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime = remainigTime(model?.pickingTime);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer?.cancel();
    }
  }

  @override
  void initState() {
    super.initState();

    context.read<PickingBloc>().add(PickingEventPickTime());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PickingBloc, PickingState>(
      listener: (context, state) {
        if (state is PickingStateTimePicked) {
          setState(() {
            model = state.timeModel;
          });

          triggerTimer();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 26),
          child: Row(
            children: [
              Image.asset("assets/icons/rec.png", height: 5.h),
              SizedBox(width: 7.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget("Next Pick-up ",
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFCF9).withOpacity(0.51),
                      fontSize: 15.sp),
                  textWidget(
                    remainingTime ?? "---",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                  ),
                  textWidget(
                    model != null
                        ? DateFormat("hh:mm a").format(model!.pickingTime)
                        : "---",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFCF9).withOpacity(0.51),
                  ),
                ],
              ),
              Spacer(),
              Visibility(
                visible: widget.showForwardArrow,
                child: Image.asset("assets/icons/arr.png", height: 2.3.h),
              ),
              SizedBox(width: 3.w),
            ],
          ),
        ),
      ),
    );
  }
}
