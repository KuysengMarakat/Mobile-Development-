import 'package:flutter/material.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("Green Screen")),
    );
  }
}

class RedSCreen extends StatelessWidget {
  const RedSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text("Red Screen"),),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text("Blue Screen"),),
    );
  }
}

enum AppTabs { red, green, blue }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}


class _AppState extends State<App> {
  AppTabs currentScreen = AppTabs.red;

  void redScreen(){
      setState(() {
      currentScreen = AppTabs.red;

    });
  }

  void blueScreen(){
    setState(() {
      currentScreen = AppTabs.blue;
    });
  }

  void greenScreen(){
    setState(() {
      currentScreen = AppTabs.green;
    });
  }

  Widget get content {
    if (currentScreen == AppTabs.red){
      return RedSCreen();
    }else if(currentScreen == AppTabs.blue){
      return BlueScreen();
    }else{
      return GreenScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tabs navigation")),
      body: content,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: redScreen, icon: Icon(Icons.home_outlined), color: Colors.red,),
            IconButton(onPressed: blueScreen, icon: Icon(Icons.home_outlined), color: Colors.blue,),
            IconButton(onPressed: greenScreen, icon: Icon(Icons.home_outlined), color: Colors.green,),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}

