import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../config/colors.dart';
import 'circle_network_image_widget.dart';
import 'my_image_picker.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget(
      {super.key,
      this.width,
      this.height,
      this.onSelectedImage,
      this.avatarUrl});
  final double? width;
  final double? height;
  final Function(String)? onSelectedImage;
  final String? avatarUrl;
  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  late String selectedAvatar = widget.avatarUrl ?? "";

  void selectImage() {
    final MyImagePicker imagePicker = MyImagePicker();
    imagePicker.pick();
    imagePicker.onSelection(
      (exception, data) {
        if (data is XFile) {
          setState(() {
            if (widget.onSelectedImage != null) {
              widget.onSelectedImage!(data.path);
            }
            setState(() {
              selectedAvatar = data.path;
            });
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
            child: CircleNetworkImage(
              height: widget.height ?? 115,
              width: widget.width ?? 115,
              url: selectedAvatar,
              onTapImage: widget.onSelectedImage != null
                  ? () {
                      selectImage();
                    }
                  : () {},
            ),
          ),
          Visibility(
            visible: widget.onSelectedImage != null,
            child: Positioned(
              right: 5,
              bottom: 5,
              child: Icon(
                Icons.camera_alt,
                color: MyColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
