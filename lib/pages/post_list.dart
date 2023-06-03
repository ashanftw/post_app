import 'package:flutter/material.dart';
import 'package:post_app/model/post.dart';
import 'package:post_app/repository/post_repo.dart';
import 'package:post_app/service_locator.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final postRepo = ServiceLocator.get<PostRepo>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Post>>(
          future: postRepo.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!
                    .map((e) => ListTile(
                          title: Text(e.title!),
                          subtitle: Text(e.body!),
                        ))
                    .toList(),
              );
              //return const Text('Hello world');
            }
            return const Text('No data');
          }),
    );
  }
}
