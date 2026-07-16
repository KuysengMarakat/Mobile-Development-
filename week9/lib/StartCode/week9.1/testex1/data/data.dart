//Create a custom error class so Instead of throwing random errors, we throw a clear message: throw RepositoryException('Firebase data is empty.');

import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;

class RepositoryException implements Exception {
  RepositoryException(this.message);

  final String message;
}

class ButtonStatus {
  final String url =
      "https://mobile-fc8af-default-rtdb.asia-southeast1.firebasedatabase.app/.json";

  Future<ButtonStatus> getButtonStatus() async {
    try {
      final Uri uri = Uri.parse(url);

      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw RepositoryException('Failed to fetch data from Firebase.');
      }

      Map<String, dynamic> json = convert.jsonDecode(response.body);

      String title = json["title"] as String;
      bool selected = json["selected"] as bool;

      if (json['title'] is! String) {
        throw RepositoryException('Firebase title is missing or invalid.');
      }

      if (json['selected'] is! bool) {
        throw RepositoryException('Firebase selected is missing or invalid.');
      }

      return ButtonStatus(title: title, selected: selected);
    } on RepositoryException {
      rethrow;
    } catch (error) {
      throw RepositoryException('No internet or Firebase connection failed.');
    }
  }

  Future<void> updateButtonStatus(bool selected) async {
    try {
      Uri uri = Uri.parse(url);

      await http.patch(uri, body: jsonEncode({"selected": selected}));
    } catch (error) {
      throw RepositoryException("Update fail");
    }
  }
}
