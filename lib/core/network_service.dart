import 'dart:convert';
import 'package:http/http.dart' as http;

enum HttpMethod { post, get, put, delete }

class NetworkService {
  final http.Client client;
  NetworkService(this.client);
  Map<String, String> headers = {'content-type': 'application/json'};

  Future<dynamic> sendRequest(
      {HttpMethod type = HttpMethod.get,
      required String path,
      dynamic body}) async {
    try {
      Uri url = Uri.parse(path);

      dynamic response;
      switch (type) {
        case HttpMethod.get:
          response = await client.get(url, headers: headers);
          break;
        case HttpMethod.post:
          response = await client.post(url, body: body, headers: headers);
          break;
        case HttpMethod.put:
          response = await client.put(url, body: body, headers: headers);
          break;
        case HttpMethod.delete:
          response = await client.delete(url, body: body, headers: headers);
          break;
        default:
      }

      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        default:
          throw Exception(
              "Request failed with status: ${response.statusCode}.");
      }
    } catch (e) {
      rethrow;
    }
  }
}
