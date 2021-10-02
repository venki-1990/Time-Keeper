import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Signinpage.dart';
void main()=>runApp(new MaterialApp(
  home: Myapp()
));
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 2500, nextScreen:SignIn(),splash: Stack(
        children: [
          Center(
            child: Text(
              "Time keeper",
              style: TextStyle(fontFamily: "SourceCodePro", fontSize: 60),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0,right: 25),
            child: Center(child: Text("GOOD THINGS TAKE TIMES",style: TextStyle(fontSize: 17,color: Colors.red),)),
          )
        ],
      ),

      ),



    );
  }
}
