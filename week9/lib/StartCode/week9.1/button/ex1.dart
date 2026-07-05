import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isSelected = false;

  final String url =
      "https://mobile-fc8af-default-rtdb.asia-southeast1.firebasedatabase.app/.json";

  AsyncData<ButtonStatus> data = AsyncData.loading();

  @override
  void initState() {
    super.initState();

    // Fetch init state from Firebase
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
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        throw RepositoryException(
          "Failed to fetch data from Firebase",
        );
      }


      final decodedData = jsonDecode(response.body);

      if (decodedData == null) {
        throw RepositoryException("Firebase data is empty");
      }

      if (decodedData is! Map<String, dynamic>) {
        throw RepositoryException("Firebase data structure is wrong");
      }

      return ButtonStatus.fromJson(decodedData);
    } catch (e) {
      if (e is RepositoryException) {
        throw e;
      }

      throw RepositoryException("No internet connection or Firebase error");
    }
  }

  void selected() {
    setState(() {
      isSelected = !isSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (data.state == AsyncState.loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (data.state == AsyncState.error) {
      return Scaffold(
        body: Center(
          child: Text(
            data.error ?? "Unknown error",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    final ButtonStatus buttonStatus = data.value!;

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: selected,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(350, 70),
            backgroundColor: isSelected
                ? const Color.fromARGB(255, 97, 158, 187)
                : Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: const BorderSide(color: Colors.grey),
            ),
          ),
          child: Text(
            buttonStatus.name.toUpperCase(),
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}

class ButtonStatus {
  final String name;
  final bool selected;

  ButtonStatus({
    required this.name,
    required this.selected,
  });

  factory ButtonStatus.fromJson(Map<String, dynamic> json) {
    if (json["name"] is! String) {
      throw RepositoryException("Field 'name' is missing or wrong");
    }

    if (json["selected"] is! bool) {
      throw RepositoryException("Field 'selected' is missing or wrong");
    }
    return ButtonStatus(
      name: json["name"],
      selected: json["selected"],
    );
  }
}

enum AsyncState {
  loading,
  success,
  error,
}

class AsyncData<T> {
  final T? value;
  final String? error;
  final AsyncState state;

  AsyncData.loading()
      : value = null,
        error = null,
        state = AsyncState.loading;
  AsyncData.success(this.value)
      : error = null,
        state = AsyncState.success;

  AsyncData.error(this.error)
      : value = null,
        state = AsyncState.error;
}
class RepositoryException implements Exception {
  final String message;

  RepositoryException(this.message);
}
void main() {
  runApp(MaterialApp(
    home: MyButton(),
  ));
}

