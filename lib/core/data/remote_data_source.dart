import 'package:http/http.dart' as http;

class RemoteDataSource {
  Future<dynamic> getData(String url) async {
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      return response.body;
    } catch (err) {
      rethrow;
    }
  }
}
