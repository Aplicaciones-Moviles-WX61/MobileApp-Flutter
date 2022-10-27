import 'dart:convert';
import 'package:intl/intl.dart';

import '../ApiConstans.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:nextparty/models/user.dart';

class registerDto {
  String name;
  String lastname;
  String email;
  String password;
  String phone;
  String birthday;

  registerDto(
      {required this.name,
      required this.lastname,
      required this.email,
      required this.password,
      required this.phone,
      required this.birthday});

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "email": email,
        "password": password,
        "phone": phone,
        "birthday": birthday,
      };
}

class userService {
  Future<String?> AuthUser(email, password) async {
    // login
    var response = await http.post(Uri.parse(ApiConstans.login),
        body: {"email": email, "password": password});
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<bool> isLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var id = prefs.getString('id');
    var response = await http.get(Uri.parse(ApiConstans.user + id!),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<String?> registerUser(registerDto user) async {
    var response = await http.post(Uri.parse(ApiConstans.register), body: {
      "name": user.name,
      "lastname": user.lastname,
      "email": user.email,
      "password": user.password,
      "phone": user.phone,
      "birthday": user.birthday
    });
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
