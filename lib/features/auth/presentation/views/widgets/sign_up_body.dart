import 'package:blog_app/features/auth/presentation/views/widgets/auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign Up View',
            style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),
          AuthTextFormField(hintText: 'Name'),
          SizedBox(height: 20.h),
          AuthTextFormField(hintText: 'Email'),
          SizedBox(height: 20.h),
          AuthTextFormField(hintText: 'Password'),
        ],
      ),
    );
  }
}
