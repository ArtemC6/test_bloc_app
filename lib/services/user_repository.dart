import 'package:test_bloc_app/services/user_api_provider.dart';

import '../models/user_model.dart';

class UserRepository {
  UserProvider _userProvider = UserProvider();

  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
