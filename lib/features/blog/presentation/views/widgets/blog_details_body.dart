import 'package:blog_app/core/functions/caluculate_data_format.dart';
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
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              height: 1.3,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "By ${blog.name}",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "created at ${calculateDateFormat(blog.updatedAt)}",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(width: 10.w),
          Text(
            "${calculateReadingTime(blog.content)} min read",
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
          ),
          SizedBox(height: 24.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              blog.imageUrl!,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            blog.content,
            style: TextStyle(
              fontSize: 18.sp,
              height: 1.8,
              color: Colors.grey[800],
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
