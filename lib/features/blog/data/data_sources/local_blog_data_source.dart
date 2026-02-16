import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:hive/hive.dart';

abstract class LocalBlogDataSource {
  Future<void> saveBlog(BlogModel blogModel);
  List<BlogModel> getBlogs();
  Future<void> saveAllBlogs(List<BlogModel> blogs);
}
class LocalBlogDataSourceImpl implements LocalBlogDataSource {
  final Box<BlogModel> blogBox;
  
  LocalBlogDataSourceImpl({required this.blogBox});
  @override
  Future<void> saveAllBlogs(List<BlogModel> blogs) async{
    await blogBox.addAll(blogs);
  }
  
  @override
  Future<void> saveBlog(BlogModel blogModel)async {
    await blogBox.add(blogModel);
  }
  
  @override
  List<BlogModel> getBlogs() {
    return blogBox.values.toList();
  }
}