import 'package:http/testing.dart';
import 'package:post_app/model/post.dart';
import 'package:post_app/repository/post_repo.dart';

class PostMock implements PostRepo {
  @override
  Future<List<Post>> getPosts() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return [
        Post(id: 1, title: 'dummy', body: 'asf asfa sjf afasfasfafsfasfas'),
        Post(id: 2, title: 'dummy1', body: 'asf asfa sjf afasfasfafsfasfas'),
        Post(id: 3, title: 'dummy2', body: 'asf asfa sjf afasfasfafsfasfas'),
      ];
    } catch (e) {
      rethrow;
    }
  }
}
