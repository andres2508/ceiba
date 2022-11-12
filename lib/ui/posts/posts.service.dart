import 'package:ceiba/infrastructure/http/http.data_source.dart';
import 'package:ceiba/model/post/posts.model.dart';

class PostService extends HttpDataSource {
  PostService(): super('/posts');

  Future<List<Post>> findByUser(int userId) {
    return this.getList('', (json) => Post.fromJson(json), queryParameters: {
      "user": userId.toString()
    });
  }
}