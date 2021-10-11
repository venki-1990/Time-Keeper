import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Dashboard.dart';
import 'Signinpage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: <String , WidgetBuilder>{
      '/nextscreen':(BuildContext context)=> NextScreen(),
      '/SignIn':(BuildContext context)=> SignIn
        ()
    },
      home: Myapp()));
}
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return
      AnimatedSplashScreen(
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
     );
  }
}
