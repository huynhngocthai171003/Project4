import 'package:flutter/material.dart';
import 'package:travel_app/core/model_ui/post_model_UI.dart';

abstract class IPostViewModel extends ChangeNotifier {
  List<PostModelUI> get posts;
  set posts(List<PostModelUI> value);
  Future<void> init();
  bool get isLoading;
  Future<List<PostModelUI>> getPost();
  Future<PostModelUI> createPost(PostModelUI model);
  Future<PostModelUI> updatePost(PostModelUI model);
  Future<void> deletePost(int id);
  List<PostModelUI> getPostById();
  List<PostModelUI> getOtherPost();
}
