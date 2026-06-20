import 'package:flutter/material.dart';


class SelectedButton extends StatefulWidget {
  const SelectedButton({super.key, required this.isSelected});
  
  final bool isSelected;

  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  bool isSelected = false; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                width: 400,
                height: 100,
                child: ElevatedButton(
                    onPressed: () {
                      setState((){
                        isSelected = !isSelected;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? Colors.blue : Colors.grey,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.all(20),
                    ),
                    child: Center(
                      child: Text(
                        isSelected ? 'Selected' : 'Not Selected',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              );
  }
}
void main() {
    runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              SelectedButton(isSelected: false),
              SizedBox(height: 20,),
              SelectedButton(isSelected: true),
              SizedBox(height: 20,),
              SelectedButton(isSelected: false),

            ],
          ),
        ),
      ),
    )
);
}
