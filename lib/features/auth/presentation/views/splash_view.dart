import 'package:blog_app/core/utils/app_router.dart';
import 'package:blog_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          GoRouter.of(context).go(AppRouter.blogRoute);
        } else if (state is AuthInitial || state is AuthError) {
          GoRouter.of(context).go(AppRouter.signInRoute);
        }
      },
      child: Scaffold(
        body: Center(child: Icon(Icons.add_to_photos, size: 100.r)),
      ),
    );
  }
}
