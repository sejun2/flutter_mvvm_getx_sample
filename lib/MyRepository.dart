import 'package:http/http.dart' as http;

class MyRepository {
  Future<http.Response> fetchData() async {
    var client = http.Client();

    return await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
  }
}
