import 'dart:io';

import 'package:blog_app/core/theme/app_palette.dart';
import 'package:blog_app/core/utils/image_taking.dart';
import 'package:blog_app/features/blog/presentation/manager/blog_cubit/blog_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          // ignore: use_build_context_synchronously
          BlocProvider.of<BlogCubit>(context).setImage(_image!);
          setState(() {});
        },
        child: _image != null
            ? ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10.r),
                child: Image.file(
                  _image!,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
