import 'package:blog_app/features/blog/presentation/widgets/add_blog_body.dart';
import 'package:flutter/material.dart';

class AddBlogView extends StatelessWidget {
  const AddBlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Blog"),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.done))],
        ),
        body: AddBlogBody(),
      ),
    );
  }
}
