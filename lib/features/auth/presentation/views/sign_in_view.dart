import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'Sign In View',
            style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
