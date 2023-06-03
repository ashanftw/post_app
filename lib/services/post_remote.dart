import 'package:post_app/core/network_service.dart';
import 'package:post_app/model/post.dart';
import 'package:post_app/repository/post_repo.dart';

class PostRemote implements PostRepo {
  final NetworkService client;
  PostRemote(this.client);

  @override
  Future<List<Post>> getPosts() async {
    try {
      List<Post> posts = [];
      var reponse = await client.sendRequest(
          path: 'https://jsonplaceholder.typicode.com/posts');

      for (var i = 0; i < reponse.length; i++) {
        posts.add(Post.fromJson(reponse[i]));
      }

      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
