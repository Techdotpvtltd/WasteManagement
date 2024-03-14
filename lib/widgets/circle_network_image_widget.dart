/// Project: 	   playtogethher
/// File:    	   circle_network_image_widget
/// Path:    	   lib/widgets/circle_network_image_widget.dart
/// Author:       Ali Akbar
/// Date:        13-03-24 13:49:57 -- Wednesday
/// Description:

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/config/colors.dart';
import 'custom_network_image.dart';

class CircleNetworkImage extends StatelessWidget {
  const CircleNetworkImage({
    super.key,
    required this.url,
    this.onTapImage,
    this.width,
    this.height,
  });
  final String url;
  final VoidCallback? onTapImage;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 50,
      height: height ?? 50,
      child: InkWell(
        onTap: onTapImage,
        child: DottedBorder(
          borderType: BorderType.Circle,
          color: MyColors.primary,
          stackFit: StackFit.expand,
          padding: EdgeInsets.all(2),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(300),
              ),
            ),
            child: CustomNetworkImage(
              imageUrl: url,
              backgroundColor: Colors.transparent,
              showPlaceholder: false,
            ),
          ),
        ),
      ),
    );
  }
}
