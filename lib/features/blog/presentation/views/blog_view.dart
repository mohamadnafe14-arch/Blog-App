import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              onPressed: () {},
              icon: Icon(CupertinoIcons.add_circled),
            ),
          ],
        ),
      ),
    );
  }
}
