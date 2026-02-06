import 'package:blog_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:blog_app/features/auth/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String signInRoute = '/sign-in';
  static final appRouter = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: signInRoute,
        builder: (context, state) => const SignInView(),
      ),
    ],
  );
}
