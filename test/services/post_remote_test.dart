import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:post_app/core/network_service.dart';
import 'package:post_app/services/post_remote.dart';

@GenerateMocks([http.Client])
void main() {
  // late MockClient mockClient;
  // late NetworkService mockNetworkService;
  late NetworkService realNetworkService;
  late PostRemote postRemote;

  setUp(() {
    // const fn = MockClientHandler;
    // mockClient = MockClient(fn as Future<Response> Function(Request));
    // mockNetworkService = NetworkService(mockClient);
    realNetworkService = NetworkService(http.Client());
    postRemote = PostRemote(realNetworkService);
  });

  tearDown(() {
    // mockClient.close();
  });
  group('Fetch APIs from network manager class', () {
    test('Call actual api', () async {
      // ARRANGE
      var res = await postRemote.getPosts();
      //print(res.length);

      // ACT & ASSERT
      //expect(await networkManager.sendRequest(path: url), isA<dynamic>());
    });

    // test('Should return jsondecoded valus for http success call', () async {
    //   // ARRANGE
    //   String url = 'https://api.sampleapis.com/avatar/info';
    //   when(mockClient.get(Uri.parse(url), headers: {
    //     'content-type': 'application/json'
    //   })).thenAnswer((realInvocation) async => http.Response(
    //       '[{"id": 3,"name": "Clementine Bauch", "email": "Nathan@yesenia.net"}]',
    //       200));

    //   // ACT & ASSERT
    //   expect(await networkManager.sendRequest(path: url), isA<dynamic>());
    // });

    // test('Should throw an exception if something went wrong', () async {
    //   // ARRANGE
    //   String url = 'https://api.sampleapis.com/avatar/';
    //   when(mockClient.get(Uri.parse(url), headers: {
    //     'content-type': 'application/json'
    //   })).thenAnswer((realInvocation) async => http.Response('not found', 400));

    //   // ACT & ASSERT
    //   expect(networkManager.sendRequest(path: url), throwsException);
    // });
  });
}
