import 'package:blog_app/core/utils/app_router.dart';
import 'package:blog_app/features/auth/presentation/views/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SignUpBody(
          goToBlogPage: () {
            context.go(AppRouter.blogRoute);
          },
        ),
        appBar: AppBar(),
      ),
    );
  }
}
