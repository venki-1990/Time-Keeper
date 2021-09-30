import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()=>runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
    home: Login()
));
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Padding(padding: EdgeInsets.only(right: 25.0),
                 child: Text("Welcome To Timekeeper",style: TextStyle(color: Colors.blue,fontSize: 30)),
               ),
             ],

           ),
         )
       ],

     ),
    );
  }
}


