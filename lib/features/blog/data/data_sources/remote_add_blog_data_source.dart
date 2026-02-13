import 'dart:io';

import 'package:blog_app/core/errors/exceptions.dart';
import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RemoteAddBlogDataSource {
  Future<BlogModel> uploadBlog(BlogModel blogModel);
  Future<String> uploadImage(BlogModel blogModel, File image);
}

class RemoteAddBlogDataSourceImpl implements RemoteAddBlogDataSource {
  final SupabaseClient supabaseClient;
  RemoteAddBlogDataSourceImpl(this.supabaseClient);
  @override
  Future<BlogModel> uploadBlog(BlogModel blogModel) async {
    try {
      final response = await supabaseClient
          .from('blogs')
          .insert(blogModel.toMap())
          .single();
      return BlogModel.fromMap(response);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadImage(BlogModel blogModel, File image) async {
    try {
      await supabaseClient.storage
          .from("blog_images")
          .upload(blogModel.id, image);
      return supabaseClient.storage
          .from("blog_images")
          .getPublicUrl(blogModel.id);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}
