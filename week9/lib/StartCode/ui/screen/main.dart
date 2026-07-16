import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:week9/StartCode/week9.1/Todo/data/repository/repository_exception.dart';
import 'package:week9/StartCode/week9.1/ex1/data/data.dart';
import 'package:week9/StartCode/week9.1/ex1/model/data_model.dart' hide RepositoryException;


class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isSelected = false;
  
  String get title => null;

  void selected() {
    setState(() {
      isSelected = !isSelected;
    });
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: selected,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? const Color.fromARGB(255, 97, 158, 187)
                : Colors.white,
          ),
          child: Text(title),
        ),
      ),
    );
  }
}