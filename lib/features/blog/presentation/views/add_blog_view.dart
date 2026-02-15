import 'package:blog_app/core/utils/app_router.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/add_blog_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddBlogView extends StatelessWidget {
  const AddBlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AddBlogBody(
          pop: () => GoRouter.of(context).push(AppRouter.blogRoute),
        ),
      ),
    );
  }
}
