import 'package:blog_app/core/functions/caluculate_reading_time.dart';
import 'package:blog_app/core/theme/app_palette.dart';
import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({
    super.key,
    required this.blog,
    required this.backgroundColor,
  });
  final Blog blog;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.all(16.h).copyWith(bottom: 4.h),
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: blog.topics!
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Chip(
                            label: Text(e),
                            backgroundColor: AppPallete.borderColor,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                blog.title,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
            ],
          ),
          Text(
            "${calculateReadingTime(blog.content)} minute",
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
