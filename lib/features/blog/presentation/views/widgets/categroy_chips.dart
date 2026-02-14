import 'package:blog_app/features/blog/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategroyChips extends StatelessWidget {
  const CategroyChips({super.key});
  static const List<String> categories = <String>[
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategroyChips.categories.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 8.h),
          child: CategoryItem(name: CategroyChips.categories[index]),
        ),
      ),
    );
  }
}
