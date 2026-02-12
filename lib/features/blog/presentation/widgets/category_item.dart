import 'package:blog_app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.name, required this.isSelected});
  final String name;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(name),
      backgroundColor: isSelected
          ? AppPallete.gradient1
          : AppPallete.borderColor,
    );
  }
}
