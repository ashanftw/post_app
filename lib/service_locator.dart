import 'package:post_app/core/network_service.dart';
import 'package:post_app/services/post_mock.dart';
import 'package:post_app/services/post_remote.dart';
import 'package:http/http.dart' as http;

import 'repository/post_repo.dart';

class ServiceLocator {
  static final Map<Type, dynamic> _services = {};

  static void register<T>(T service) {
    _services[T] = service;
  }

  static T get<T>() {
    return _services[T];
  }

  static void useMockService(bool useMock) {
    if (useMock) {
      register<PostRepo>(PostMock());
    } else {
      register<PostRepo>(PostRemote(NetworkService(http.Client())));
    }
  }
}
