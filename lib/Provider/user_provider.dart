
import 'package:api_task/Provider/service_api.dart';
import 'package:flutter/material.dart';
import '../Model/user_model.dart';

class UserProvider with ChangeNotifier {
  List<UsersModel> _users = [];
  bool _isLoading = false;
  String? _error;

  List<UsersModel> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final ServiceApi _apiService = ServiceApi();

  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _users = await _apiService.fetchUsers();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}