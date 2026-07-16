
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:week9/StartCode/week9.1/ex1/model/data_model.dart';

final String url =
      "https://mobile-fc8af-default-rtdb.asia-southeast1.firebasedatabase.app/.json";

Future<ButtonStatus> getButtonStatus() async {
    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);

    Map<String, dynamic> json =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    String title = json['title'] as String;
    bool selected = json['selected'] as bool;

    return ButtonStatus(title: title, selected: selected);
  }