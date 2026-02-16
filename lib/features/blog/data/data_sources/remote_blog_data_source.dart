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
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadImage(BlogModel blogModel, File image) async {
    try {
      await supabaseClient.storage.from("blog-images").upload(
            blogModel.id,
            image,
            fileOptions: const FileOptions(upsert: true),
          );
      return supabaseClient.storage
          .from("blog-images")
          .getPublicUrl(blogModel.id);
    } on StorageException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getBlogs() async {
    try {
      final response = await supabaseClient
          .from('blogs')
          .select("*, profiles(name)")
          .order('updated_at', ascending: false);
      
      return (response as List).map((blogData) {
        String? userName;
        
        if (blogData['profiles'] != null && blogData['profiles'] is Map) {
          userName = blogData['profiles']['name'] as String?;
        }
        
        return BlogModel.fromMap(blogData).copyWith(
          name: userName ?? "Unknown User",
        );
      }).toList();
      
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}