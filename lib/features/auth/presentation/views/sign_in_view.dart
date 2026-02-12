import 'package:blog_app/core/utils/app_router.dart';
import 'package:blog_app/features/auth/presentation/views/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SignInBody(
      gotoBlogPage: () {
        context.go(AppRouter.blogRoute);
      },
    )));
  }
}
