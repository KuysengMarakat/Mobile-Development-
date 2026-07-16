import 'package:flutter/material.dart';
import 'package:week_10/data/repositories/scores_repository.dart';
import 'package:week_10/data/services/auth_service.dart';

import '../model/score.dart';

// ignore: must_be_immutable
class ScoresScreen extends StatefulWidget {
  ScoresScreen({super.key, required this.authenticationService});
  AuthenticationService authenticationService;
  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

enum Asyncstate { loading, Sucessful, error }

class _ScoresScreenState extends State<ScoresScreen> {
  List<Score> scores = [];
  String? error;
  Asyncstate asyncstate = Asyncstate.loading;
  ScoresRepository scoresRepository = ScoresRepository.instance;

  @override
  void initState() {
    super.initState();

    fetchSCores();
  }

  void fetchSCores() async {
    asyncstate = Asyncstate.loading;
    // Ask the ScoresRepository instance to fetch the scores
    try {
      scores = await scoresRepository.getSCores();   
      setState(() {
        asyncstate = Asyncstate.Sucessful;
      });
    } catch (e) {
      print("no wifi");
      setState(() {
        asyncstate = Asyncstate.error;
      });
    }

    // if succes, update the scores list and refresh
    // If failure, update the error and refresh
  }

  String? get userName {
    // Ask the AuthenticationService instance the current user nale (if any)

    return widget.authenticationService.session!.user.name;
  }

  Widget get content {
    // If scores list => dispaly the list using the ScoreTile

    // if error, dispaly the erro in red, centered

    // otherwise, we disaply the  CircularProgressIndicator
    switch (asyncstate) {
      case Asyncstate.loading:
        return CircularProgressIndicator();

      case Asyncstate.Sucessful:
        return ListView.builder(
          itemCount: scores.length,
          itemBuilder: (context, index) => ScoreTile(score: scores[index]),
        );
      case Asyncstate.error:
        return Center(child: Text("TTTT"));
    }
  }

  String get welcomeLabel => "Welcome ${userName != null ? userName! : ""} !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(title: Text(welcomeLabel), actions: [Icon(Icons.login)]),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20.0), child: content),
      ),
    );
  }
}

class ScoreTile extends StatelessWidget {
  const ScoreTile({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: ListTile(
          title: Text(score.title),
          trailing: score.value >= 75
              ? Text(
                  "${score.value.toString()}/100",
                  style: TextStyle(color: Colors.green),
                )
              : score.value >= 50 ?
              Text(
                  "${score.value.toString()}/100",
                  style: TextStyle(color: Colors.orange),
                )
                : Text(
                  "${score.value.toString()}/100",
                  style: TextStyle(color: Colors.red),
                )
        ),
      ),
    );
  }
}
