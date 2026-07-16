import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../model/auth_session.dart';
import '../../model/score.dart';
import '../services/auth_service.dart';

class ScoresRepository {
  static ScoresRepository instance = ScoresRepository();

  Future<List<Score>> getSCores() async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri scoresUri = baseUri.replace(path: "/scores");
    List<Score> result = [];

    AuthSession? session = AuthenticationService.instance.session;
    if (session == null) {
      throw Exception("Cannot fetch without authentication");
    }

    // Fetch the GET /scores with the token included in the headers
    Response response = await http.get(
      scoresUri,
      headers: {
        "Authorization": "Bearer ${session.token}",
        "content-type": "application/json",
      },
    );

    //  If statusCode 200, decode the json body

    if (response.statusCode == 200) {
      List<dynamic> jsons = jsonDecode(response.body);

      for (var json in jsons) {
        result.add(Score.fromJSon(json));     //why need this? 
      }
    } else {
      throw Exception("Failed to convert!");
    }

    // Convert the json to the lost of scores

    // Ifd success Return the scores

    // If no success throw exception

    return result; // fake
  }
}


// void main () async{
//     final Uri baseUri = Uri.parse("http://localhost:3000");
//     final Uri scoresUri = baseUri.replace(path: "/scores");
//     String token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsIm5hbWUiOiJqb2huIiwicm9sZSI6InN0dWRlbnQiLCJpYXQiOjE3ODM5MzAyNDEsImV4cCI6MTc4MzkzMzg0MX0.pItgWSVKDV-bGu7Lo-54hgnoq2tU68YpNk0QMqtj9oQ";
//     // AuthSession? session = AuthenticationService.instance.session;
//     // if (session == null) {
//     //   throw Exception("Cannot fetch without authentication");
//     // }
    
//     Response response = await http.get(
//       scoresUri,
//       headers: {
//         "Authorization" : "Bearer : ${token}",
//         "content-type" : "application/json",
//       }
//     );

//     if(response.statusCode == 200){
//       List<dynamic> jsons = jsonDecode(response.body);
//       List<Score> result = [];
//       for (var json in jsons ){
//         result.add(Score.fromJSon(json));
//         print(json);
       
//       }
//       print(result);
//     }
// }