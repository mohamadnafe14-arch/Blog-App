import 'package:blog_app/features/auth/presentation/views/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: SignUpBody(), appBar: AppBar()),
    );
  }
}
