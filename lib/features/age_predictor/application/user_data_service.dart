import 'package:agify_app/features/age_predictor/data/user_data_repoistory.dart';
import 'package:agify_app/features/age_predictor/domain/user_model.dart';

class UserDataService {
  UserDataRepository userDataRepo = UserDataRepository();

  Future<User> fetchUserData(String name) async {
    return userDataRepo.fetchAge(name);
  }
}
