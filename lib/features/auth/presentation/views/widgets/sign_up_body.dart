import 'package:blog_app/core/utils/app_router.dart';
import 'package:blog_app/features/auth/presentation/views/widgets/auth_button.dart';
import 'package:blog_app/features/auth/presentation/views/widgets/auth_text_form_field.dart';
import 'package:blog_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late GlobalKey<FormState> formKey;
  String? name, email, password;
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
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            AuthTextFormField(
              hintText: 'Name',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              onSaved: (value) {
                name = value;
              },
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
                      content: Text(
                        'Name: $name\nEmail: $email\nPassword: $password',
                      ),
                    ),
                  );
                }
              },
              text: 'Sign Up',
            ),
            SizedBox(height: 20.h),
            CustomTextButton(
              firstText: "Already have an account?",
              btnText: "Sign In",
              onTap: () {
                GoRouter.of(context).push(AppRouter.signInRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
