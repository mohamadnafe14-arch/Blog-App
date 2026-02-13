import 'package:blog_app/core/theme/app_palette.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddingPhotoWidget extends StatelessWidget {
  const AddingPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RectDottedBorderOptions(
        dashPattern: [10, 5],
        strokeWidth: 2,
        color: AppPallete.borderColor,
        strokeCap: StrokeCap.round,
      ),
      child: SizedBox(
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
    );
  }
}
