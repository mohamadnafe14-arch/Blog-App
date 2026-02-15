import 'package:blog_app/features/blog/presentation/views/widgets/add_blog_body.dart';
import 'package:flutter/material.dart';

class AddBlogView extends StatelessWidget {
  const AddBlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AddBlogBody(),
      ),
    );
  }
}
