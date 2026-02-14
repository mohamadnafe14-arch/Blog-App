import 'package:blog_app/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.name});
  final String name;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
        setState(() {});
      },
      child: Chip(
        label: Text(widget.name),
        backgroundColor: isSelected
            ? AppPallete.gradient1
            : AppPallete.borderColor,
      ),
    );
  }
}
