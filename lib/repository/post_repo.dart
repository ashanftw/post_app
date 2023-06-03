import 'package:post_app/model/post.dart';

abstract class PostRepo {
  Future<List<Post>> getPosts();
}
