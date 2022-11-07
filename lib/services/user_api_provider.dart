import 'package:test_bloc_app/models/user_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider {
  // https://jsonplaceholder.typicode.com/users

  Future<List<User>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error');
    }
  }

// Future<List<User>> getUsers() async {
//   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//
//   if (response.statusCode == 200) {
//     final List<dynamic> userJson = json.decode(response.body);
//     return userJson.map((json) => User.fromJson(json)).toList();
//   } else {
//     throw Exception('Error fetching users');
//   }
// }

// Future<List<User>> getUser async () {
//   final response = await Http.
// }
}
