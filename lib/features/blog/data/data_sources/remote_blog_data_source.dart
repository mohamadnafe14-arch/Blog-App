import 'dart:io';

import 'package:blog_app/core/errors/exceptions.dart';
import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RemoteBlogDataSource {
  Future<BlogModel> uploadBlog(BlogModel blogModel);
  Future<String> uploadImage(BlogModel blogModel, File image);
  Future<List<BlogModel>> getBlogs();
}

class RemoteBlogDataSourceImpl implements RemoteBlogDataSource {
  final SupabaseClient supabaseClient;
  RemoteBlogDataSourceImpl(this.supabaseClient);
  @override
  Future<BlogModel> uploadBlog(BlogModel blogModel) async {
    try {
      final response = await supabaseClient
          .from('blogs')
          .insert(blogModel.toMap())
          .select()
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
          .from("blog-images")
          .upload(blogModel.id, image);
      return supabaseClient.storage
          .from("blog-images")
          .getPublicUrl(blogModel.id);
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getBlogs() async {
    try {
      final response = await supabaseClient
          .from('blogs')
          .select("*, profiles(name)");
      return response
          .map(
            (e) => BlogModel.fromMap(e).copyWith(name: e["profiles"]["name"]),
          )
          .toList();
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}
