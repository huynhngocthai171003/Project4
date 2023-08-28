import 'package:flutter/material.dart';
import 'package:travel_app/core/global/global_data.dart';
import 'package:travel_app/core/global/locator.dart';
import 'package:travel_app/core/model_ui/post_model_UI.dart';
import 'package:travel_app/core/services/implements/post_service.dart';
import 'package:travel_app/core/services/interfaces/ipost_service.dart';
import 'package:travel_app/core/view_model/interfaces/ipost_view_model.dart';

class PostViewModel extends ChangeNotifier implements IPostViewModel {
  List<PostModelUI> _posts = [];
  bool _isLoading = true;
  @override
  bool get isLoading => _isLoading;

  @override
  List<PostModelUI> get posts => _posts;

  final IPostService _postService = locator<IPostService>();

  @override
  Future<void> init() async {
    final listPost = await _postService.getPost();
    _posts = listPost;
    _isLoading = false;
    notifyListeners();
  }

  @override
  Future<List<PostModelUI>> getPost() async {
    return await _postService.getPost();
  }

  @override
  Future<PostModelUI> createPost(PostModelUI model) async {
    return await _postService.createPost(model);
  }

  @override
  Future<PostModelUI> updatePost(PostModelUI model) async {
    return await _postService.updatePost(model);
  }

  @override
  Future<void> deletePost(int id) async {
    await _postService.deletePost(id);
  }

  @override
  List<PostModelUI> getPostById() {
    List<PostModelUI> result = [];
    int id = locator<GlobalData>().currentUser!.id;
    for (var i in _posts) {
      if (i.userId.id == id) {
        result.add(i);
      }
    }
    return result;
  }

  @override
  List<PostModelUI> getOtherPost() {
    List<PostModelUI> result = [];
    int id = locator<GlobalData>().currentUser!.id;
    for (var i in _posts) {
      if (i.userId.id != id) {
        result.add(i);
      }
    }
    return result;
  }

  @override
  set posts(List<PostModelUI> value) {
    posts = value;
  }
}
