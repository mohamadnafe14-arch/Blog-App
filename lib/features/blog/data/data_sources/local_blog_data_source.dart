import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:hive/hive.dart';

abstract class LocalBlogDataSource {
  List<BlogModel> getBlogs();
  Future<void> saveAllBlogs(List<BlogModel> blogs);
  Future<void> clearAllBlogs();
}
class LocalBlogDataSourceImpl implements LocalBlogDataSource {
  final Box<BlogModel> blogBox;
  
  LocalBlogDataSourceImpl({required this.blogBox});
  @override
  Future<void> saveAllBlogs(List<BlogModel> blogs) async{
    await blogBox.addAll(blogs);
  }
  

  
  @override
  List<BlogModel> getBlogs() {
    return blogBox.values.toList();
  }
  
  @override
  Future<void> clearAllBlogs() async{
    await blogBox.clear();
  }
}