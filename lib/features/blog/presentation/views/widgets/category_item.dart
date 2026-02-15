import 'package:blog_app/core/theme/app_palette.dart';
import 'package:blog_app/features/blog/presentation/manager/blog_cubit/blog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider.of<BlogCubit>(context).considerTopics(widget.name);
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
