import 'package:blog_app/core/utils/app_router.dart';
import 'package:blog_app/features/blog/presentation/manager/blog_cubit/blog_cubit.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/blogs_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  void initState() {
    BlocProvider.of<BlogCubit>(context).fetchBlogs();
    super.initState();
  }
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
                GoRouter.of(context).push(AppRouter.addBlogRoute);
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
