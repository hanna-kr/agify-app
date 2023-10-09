import 'dart:convert';

import 'package:agify_app/core/data/remote_data_source.dart';
import 'package:agify_app/features/age_predictor/domain/user_model.dart';

class UserDataRepository {
  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<User> fetchAge(String name) async {
    Uri url = Uri.parse('https://api.agify.io?name=$name');
    dynamic responseData = await remoteDataSource.getData(url.toString());
    var jsonResponse = jsonDecode(responseData);
    if (jsonResponse != null) {
      return User.fromJson(jsonResponse);
    } else {
      throw Exception('Userdaten konnten nicht geladen werden');
    }
  }
}
