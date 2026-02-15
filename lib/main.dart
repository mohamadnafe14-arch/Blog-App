import 'package:blog_app/core/theme/app_theme.dart';
import 'package:blog_app/core/utils/app_router.dart';
import 'package:blog_app/core/utils/service_locator.dart';
import 'package:blog_app/features/auth/domain/usecases/get_current_user_use_case.dart';
import 'package:blog_app/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:blog_app/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:blog_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:blog_app/features/blog/domain/usecases/add_blog_use_case.dart';
import 'package:blog_app/features/blog/presentation/manager/blog_cubit/blog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
              getCurrentUserUseCase: getIt.get<GetCurrentUserUseCase>(),
              signInUseCase: getIt.get<SignInUseCase>(),
              signUpUseCase: getIt.get<SignUpUseCase>(),
            )..getCurrentUser(),
          ),
          BlocProvider<BlogCubit>(
            create: (context) => BlogCubit(getIt.get<AddBlogUseCase>()),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.appRouter,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
        ),
      ),
    );
  }
}
