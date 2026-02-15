import 'package:blog_app/core/utils/app_router.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/blogs_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Blog App"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).go(AppRouter.addBlogRoute);
              },
              icon: Icon(CupertinoIcons.add_circled),
            ),
          ],
        ),
        body: BlogsBody(),
      ),
    );
  }
}
