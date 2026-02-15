import 'package:blog_app/features/blog/presentation/manager/blog_cubit/blog_cubit.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/failure_body.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/loading_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogsBody extends StatelessWidget {
  const BlogsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogCubit, BlogState>(
      builder: (context, state) {
        if (state is BlogLoading) {
          return const LoadingBody();
        } else if (state is BlogFailure) {
          return FailureBody(errMessage: state.message);
        } else if (state is FetchBlogsSuccess) {
          return ListView.builder(
            itemCount: state.blogs.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
              child: Text(state.blogs[index].title),
            ),
          );
        }
        return Container();
      },
    );
  }
}
