import 'package:travel_app/core/model_ui/post_model_UI.dart';
import 'package:travel_app/core/services/interfaces/ipost_service.dart';

import '../../global/locator.dart';

class PostService implements IPostService {
  @override
  Future<List<PostModelUI>> getPost() async {
    return await getRestClient().getPost();
  }

  @override
  Future<PostModelUI> createPost(PostModelUI post) async {
    return await getRestClient().createPost(post);
  }

  @override
  Future<PostModelUI> updatePost(PostModelUI post) async {
    return await getRestClient().updatePost(post);
  }

  @override
  Future<void> deletePost(int id) async {
    await getRestClient().deletePost(id);
  }
}
