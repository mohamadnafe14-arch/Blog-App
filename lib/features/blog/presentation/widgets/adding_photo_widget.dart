import 'dart:io';

import 'package:blog_app/core/theme/app_palette.dart';
import 'package:blog_app/core/utils/image_taking.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddingPhotoWidget extends StatefulWidget {
  const AddingPhotoWidget({super.key});

  @override
  State<AddingPhotoWidget> createState() => _AddingPhotoWidgetState();
}

class _AddingPhotoWidgetState extends State<AddingPhotoWidget> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RectDottedBorderOptions(
        dashPattern: [10, 5],
        strokeWidth: 2,
        color: AppPallete.borderColor,
        strokeCap: StrokeCap.round,
      ),
      child: GestureDetector(
        onTap: () async {
          _image = await pickImage();
          setState(() {});
        },
        child: _image != null
            ? ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10.r),
                child: Image.file(
                  _image!,
                  fit: BoxFit.cover,
                  height: 200.h,
                  width: 200.w,
                ),
              )
            : SizedBox(
                height: 200.h,
                width: 200.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, size: 50.r),
                    SizedBox(height: 10.h),
                    Text('Add Photo'),
                  ],
                ),
              ),
      ),
    );
  }
}
