// void main(){
//   runapp(
//     const center(ArgumentError
//       child: text(
//         'Hello world'))
//   )
// }

// void main(){
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Container(
//         color: Colors.blue,
//         child: Container(
//           color: Colors.lightblue,
//           child: Center(
//             child: Text("Homara"),
//         ))
//   )))
// }

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
        color: Colors.blue,
        child: Column({
          mainAxisAlignment: MainAxisAlignment.center,

          childen: [

            Container(

              
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius.all(30)),
              color: Colors.blue,
              child: Center(child: Text("Marakat"), style: TextStyle(color: Colors.black)),
            ), //container

            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius.all(30)),
              color: Colors.blue,
              child: Center(child: Text("Simu")),
            ), //container

            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius.all(30)),
              color: Colors.blue,
              child: Center(child: Text("shengyao")),
            ),  //container


          ],
        })
  )))
}