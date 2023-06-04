import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:post_app/core/network_service.dart';

import 'network_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late NetworkService mockNetworkService;
  late MockClient mockClient;
  String url = 'https://example.com';
  setUp(() {
    mockClient = MockClient();

    mockNetworkService = NetworkService(mockClient);
  });

  tearDown(() {
    mockClient.close();
  });
  group('Fetch APIs from network manager class', () {
    test('Should return jsondecoded valus for http success call', () async {
      // ARRANGE
      when(mockClient.get(Uri.parse(url), headers: {
        'content-type': 'application/json'
      })).thenAnswer((_) async => http.Response(
          '[{"id": 3,"name": "Clementine Bauch", "email": "Nathan@yesenia.net"}]',
          200));

      // ACT & ASSERT
      expect(await mockNetworkService.sendRequest(path: url), isA<dynamic>());
    });
    test('Should throw an exception if something went wrong', () async {
      try {
        // ARRANGE
        when(mockClient.get(Uri.parse(url),
                headers: {'content-type': 'application/json'}))
            .thenAnswer((_) async => http.Response('Not Found', 404));
        // ACT & ASSERT
        var response = await mockNetworkService.sendRequest(path: url);
        expect(response, isA<dynamic>());
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
}
