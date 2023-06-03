import 'package:flutter/material.dart';
import 'package:post_app/pages/post_list.dart';
import 'package:post_app/service_locator.dart';

void main() {
  ServiceLocator.useMockService(true);

  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
    ),
    home: const PostList(),
  ));
}
