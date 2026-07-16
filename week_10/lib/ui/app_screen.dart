import 'package:practice/Code/ui/scores_screen.dart';
import 'package:practice/Copy/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'auth_screen.dart';
 
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

 
  AuthenticationService authenticationService = AuthenticationService.instance;      //why use this? 
  
 
 
  
  void onLogin()  {
    
      setState(() {
       
      });
  }

  Widget get content {
    bool isbool = authenticationService.isLoggedIn;     //how do you know it's isLoggedIn?
    if(isbool){
      return ScoresScreen(authenticationService: authenticationService,);
    }
    else{
      return AuthScreen(onLogin: onLogin,authenticationService: authenticationService,);
    }

    
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
