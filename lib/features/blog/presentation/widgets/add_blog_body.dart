import 'package:blog_app/features/blog/presentation/widgets/adding_photo_widget.dart';
import 'package:blog_app/features/blog/presentation/widgets/categroy_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBlogBody extends StatefulWidget {
  const AddBlogBody({super.key});

  @override
  State<AddBlogBody> createState() => _AddBlogBodyState();
}

class _AddBlogBodyState extends State<AddBlogBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.center,
            child: AddingPhotoWidget(),
          ),
          SizedBox(height: 20.h),
          CategroyChips(),
        ],
      ),
    );
  }
}
