import 'package:blog_app/features/blog/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategroyChips extends StatefulWidget {
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
  State<CategroyChips> createState() => _CategroyChipsState();
}

class _CategroyChipsState extends State<CategroyChips> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategroyChips.categories.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 8.h),
          child: GestureDetector(
            onTap: () {
              if (selectedIndex != index) {
                setState(() {
                  selectedIndex = index;
                });
              }
            },
            child: CategoryItem(
              name: CategroyChips.categories[index],
              isSelected: index == selectedIndex,
            ),
          ),
        ),
      ),
    );
  }
}
