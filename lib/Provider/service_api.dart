import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/user_model.dart';

class ServiceApi {
  Future<List<UsersModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => UsersModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}