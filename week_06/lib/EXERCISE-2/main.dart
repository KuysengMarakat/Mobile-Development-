import 'package:flutter/material.dart';
import 'package:myapp_flutter/EXERCISE-2/data/profile_data.dart';
import 'ui/screens/profile.dart';
 
void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(data: ronanProfile),
  ));
}
