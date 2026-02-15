import 'package:blog_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:blog_app/features/blog/presentation/manager/blog_cubit/blog_cubit.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/adding_photo_widget.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/categroy_chips.dart';
import 'package:blog_app/features/blog/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBlogBody extends StatefulWidget {
  final VoidCallback pop;
  const AddBlogBody({super.key, required this.pop});
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
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Blog added')));
          widget.pop();
        } else if (state is BlogFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
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
                          final cubit = BlocProvider.of<BlogCubit>(context);
                          if (cubit.image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please add a photo'),
                              ),
                            );
                            return;
                          }
                          if (cubit.topics.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please add a topic'),
                              ),
                            );
                            return;
                          }
                          cubit.addBlog(
                            title: title!,
                            posterId:
                                (BlocProvider.of<AuthCubit>(context).state
                                        as AuthSuccess)
                                    .user
                                    .id,
                            content: content!,
                            image: cubit.image!,
                            topics: cubit.topics,
                          );
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
