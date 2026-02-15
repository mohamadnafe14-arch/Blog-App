import 'package:blog_app/core/theme/app_palette.dart';
import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.all(16.h),
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppPallete.gradient1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Row(
                  children: blog.topics!
                      .map(
                        (e) => Chip(
                          label: Text(e),
                          backgroundColor: AppPallete.gradient2,
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
          Text("1 minute", style: TextStyle(fontSize: 16.sp)),
        ],
      ),
    );
  }
}
