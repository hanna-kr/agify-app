import 'dart:convert';
import 'package:agify_app/features/age_predictor/domain/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<User>> fetchAge(String name) async {
    Uri url = Uri.parse('https://api.agify.io?name=$name');
    http.Response response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse is List) {
      return jsonResponse.map((val) => User.fromJson(val)).toList();
    } else {
      return [User.fromJson(jsonResponse)];
    }
  }
}
