import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main()=>runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
    home: SignIn()
));
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Sign in with Google",style: TextStyle(color: Colors.white70),),
          onPressed: (){},
        )
      ),
    );
  }
}