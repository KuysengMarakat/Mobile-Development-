import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:week_10/model/user.dart';

import '../../model/auth_session.dart';

class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();

  AuthSession? session;

  bool get isLoggedIn => session != null;


  Future<void> login({required String name, required String password}) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "login");


    
    // 1- Create the JSON body with the name and password
    Map<String , dynamic> body = {"name": name, "password": password};

    // 2- Fetch the POST/login
    Response response = await http.post(
      loginUrl,
      headers: {"content-type": "application/json"},
      body: jsonEncode(body),
    );

    // 3- Decode the json
    Map<String, dynamic> json = jsonDecode(response.body);

    // 4 - If failed, throw a AuthException
    if (response.statusCode != 200) {
      throw AuthException("Enter the valid");
    }

    // 5 -  Get the token

    String token = json["token"];

    // 5 -  Get the user

    Map<String, dynamic> userJson = json["user"];

    User user = User.fromJSon(userJson);
    // 6 - Update the session

    AuthSession auth = AuthSession(token: token, user: user);  // why user? 
    session = auth; 

  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
  @override
  String toString() {
    return message;
  }
}

