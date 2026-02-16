import 'package:blog_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:blog_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:blog_app/features/auth/presentation/views/splash_view.dart';
import 'package:blog_app/features/blog/domain/enities/blog.dart';
import 'package:blog_app/features/blog/presentation/views/add_blog_view.dart';
import 'package:blog_app/features/blog/presentation/views/blog_details_view.dart';
import 'package:blog_app/features/blog/presentation/views/blog_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String signUpRoute = '/sign-up';
  static const String signInRoute = '/sign-in';
  static const String blogRoute = '/blog';
  static const String addBlogRoute = '/add-blog';
  static const String blogDetailRoute = '/blog-detail';
  static final appRouter = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: signUpRoute,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: signInRoute,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(path: blogRoute, builder: (context, state) => const BlogView()),
      GoRoute(
        path: addBlogRoute,
        builder: (context, state) => const AddBlogView(),
      ),
      GoRoute(
        path: blogDetailRoute,
        builder: (context, state) {
          final blog=state.extra as Blog;
          return BlogDetailsView(blog: blog);
        },
      ),
    ],
  );
}
