import 'package:travel_app/core/model_ui/post_model_UI.dart';

abstract class IPostService {
  Future<List<PostModelUI>> getPost();
  Future<PostModelUI> createPost(PostModelUI post);
  Future<PostModelUI> updatePost(PostModelUI post);
  Future<void> deletePost(int id);
}
