
import 'package:flutter/material.dart';
import 'package:week_10/data/services/auth_service.dart';
 
import 'theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.onLogin,required this.authenticationService });

  final VoidCallback onLogin;
  final AuthenticationService authenticationService ;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
 

class _AuthScreenState extends State<AuthScreen> {
  String? errorMessage;

  String name= "";
  String password= "";
  
  

  void onLoginPressed() async {
    if(name == "" || password == ""){
      errorMessage = "Name and password shall be entered";
      widget.onLogin();
          }
    else {
      try{
        await widget.authenticationService.login(name: name, password: password);
        
        widget.onLogin();


      } on AuthException catch (e){
        setState(() {
          errorMessage = e.message;
        });
      }

      }
    }
   
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const SizedBox(height: 20),

            // Login image
            Image.asset("assset/images/login.jpg", height: 250),

            const SizedBox(height: 40),

            // Username
            TextField(
              onChanged: (value) => name = value,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 20),

            // Password
            TextField(
              onChanged: (value) => password= value,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            const SizedBox(height: 30),

            // Login button
            GestureDetector(
              onTap: onLoginPressed,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),

            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Center(
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

