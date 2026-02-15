import 'package:blog_app/core/utils/app_router.dart';
import 'package:blog_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:blog_app/features/blog/presentation/manager/blog_cubit/blog_cubit.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/adding_photo_widget.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/categroy_chips.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddBlogBody extends StatefulWidget {
  const AddBlogBody({super.key});
  @override
  State<AddBlogBody> createState() => _AddBlogBodyState();
}

class _AddBlogBodyState extends State<AddBlogBody> {
  final formKey = GlobalKey<FormState>();
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return BlocListener<BlogCubit, BlogState>(
      listener: (context, state) {
        if (state is BlogUploadSuccess) {
          GoRouter.of(context).go(AppRouter.blogRoute);
        }
      },
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add Blog', style: TextStyle(fontSize: 30.sp)),
                    Spacer(),
                    IconButton(
                      icon: const Icon(Icons.done),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          final image = BlocProvider.of<BlogCubit>(
                            context,
                          ).image;
                          if (image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please add a photo'),
                              ),
                            );
                            return;
                          }
                          final topics = BlocProvider.of<BlogCubit>(
                            context,
                          ).topics;
                          if (topics.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please add a topic'),
                              ),
                            );
                            return;
                          }
                          BlocProvider.of<BlogCubit>(context).addBlog(
                            title: title!,
                            posterId:
                                (BlocProvider.of<AuthCubit>(context).state
                                        as AuthSuccess)
                                    .user
                                    .id,
                            content: content!,
                            image: image,
                            topics: topics,
                          );
                          BlocProvider.of<BlogCubit>(context).clearImage();
                          BlocProvider.of<BlogCubit>(context).clearTopics();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Blog added')),
                          );
                          GoRouter.of(context).go(AppRouter.blogRoute);
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: AlignmentGeometry.center,
                  child: AddingPhotoWidget(),
                ),
                SizedBox(height: 20.h),
                CategroyChips(),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  onChanged: (value) => title = value,
                  onSaved: (value) => title = value,
                  hintText: 'Title',
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  onChanged: (value) => content = value,
                  onSaved: (value) => content = value,
                  hintText: 'Content',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
