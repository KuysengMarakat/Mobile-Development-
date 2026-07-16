import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ButtonStatus {
  ButtonStatus({required this.title, required this.selected});

  final String title;
  final bool selected;
}

enum AsyncState { loading, success, error }

class AsyncData<V> {
  final V? value;
  final String? error;
  final AsyncState state;

  AsyncData.loading() : value = null, error = null, state = AsyncState.loading;
  AsyncData.success(this.value) : error = null, state = AsyncState.success;
  AsyncData.error(this.error) : value = null, state = AsyncState.error;
}

class RepositoryException implements Exception {
  final String message;

  RepositoryException(this.message);
}

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isSelected = false;

  AsyncData<ButtonStatus> data = AsyncData.loading();
  final String url =
      "https://mobile-fc8af-default-rtdb.asia-southeast1.firebasedatabase.app/.json";

  void selected() async {
    bool newSelected = !isSelected;

    setState(() {
      isSelected = newSelected;
    });
    await updateButtonSelected(newSelected);
  }

  @override
  void initState() {
    super.initState();

    // Fetch init state
    _fetchButtonData();
  }

  void _fetchButtonData() async {
    setState(() => data = AsyncData.loading());

    try {
      ButtonStatus buttonStatus = await getButtonStatus();
      setState(() {
        data = AsyncData.success(buttonStatus);
        isSelected = buttonStatus.selected;
      });
    } on RepositoryException catch (e) {
      setState(() => data = AsyncData.error(e.message));
    }
  }

  Future<ButtonStatus> getButtonStatus() async {
    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);

    Map<String, dynamic> json = convert.jsonDecode(response.body);

    String title = json["title"] as String;
    bool selected = json["selected"] as bool;

    return ButtonStatus(title: title, selected: selected);
  }

  Future<void> updateButtonSelected(bool selected) async {
    Uri uri = Uri.parse(url);
    
    await http.patch(uri, body: jsonEncode({"selected" : selected}));
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (data.state == AsyncState.loading) {
      content = const CircularProgressIndicator();
    } else if (data.state == AsyncState.error) {
      content = Text(data.error ?? "Something is wrong!");
    } else {
      content = ElevatedButton(
        onPressed: selected,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.lightBlueAccent : Colors.white,
        ),
        child: Text(isSelected ? "Selected" : "Not Selected"),
      );
    }

    return Scaffold(body: Center(child: content));
  }
}

void main() {
  runApp(MaterialApp(home: MyButton()));
}
