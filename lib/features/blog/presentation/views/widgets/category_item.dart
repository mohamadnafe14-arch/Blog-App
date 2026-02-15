import 'package:blog_app/core/theme/app_palette.dart';
import 'package:blog_app/features/blog/presentation/manager/blog_cubit/blog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  const CategoryItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogCubit, BlogState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<BlogCubit>(context);
        final isSelected = cubit.isTopicSelected(name);
        return GestureDetector(
          onTap: () => cubit.toggleTopic(name),
          child: Chip(
            label: Text(name),
            backgroundColor: isSelected
                ? AppPallete.gradient1
                : AppPallete.borderColor,
          ),
        );
      },
    );
  }
}
