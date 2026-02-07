import 'package:blog_app/core/utils/app_router.dart';
import 'package:blog_app/features/auth/presentation/views/widgets/auth_button.dart';
import 'package:blog_app/features/auth/presentation/views/widgets/auth_text_form_field.dart';
import 'package:blog_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  late GlobalKey<FormState> formKey;
  String? email, password;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.h),
              Text(
                'Sign In',
                style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              AuthTextFormField(
                hintText: 'Email',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  if (value.contains('@') == false) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => email = value,
              ),
              SizedBox(height: 20.h),
              AuthTextFormField(
                hintText: 'Password',
                obscureText: true,
                onSaved: (value) => password = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              AuthButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Email: $email\nPassword: $password'),
                      ),
                    );
                  }
                },
                text: 'Sign In',
              ),
              SizedBox(height: 20.h),
              CustomTextButton(
                firstText: "Don't have an account?",
                btnText: "Sign Up",
                onTap: () {
                  GoRouter.of(context).push(AppRouter.signUpRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
