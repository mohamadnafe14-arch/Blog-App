import 'package:blog_app/core/functions/caluculate_reading_time.dart';
import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogDetailsBody extends StatelessWidget {
  const BlogDetailsBody({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            blog.title,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.h),
          Text("By ${blog.name}", style: TextStyle(fontSize: 20.sp)),
          SizedBox(height: 10.h),
          Text(
            "${calculateReadingTime(blog.content)} min read",
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 10.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(blog.imageUrl!),
          ),
          SizedBox(height: 10.h),
          Text(
            blog.content,
            style: TextStyle(fontSize: 16.sp, height: 2.h),
          ),
        ],
      ),
    );
  }
}
