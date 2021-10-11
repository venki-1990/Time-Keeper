import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _usersignInFormkey = GlobalKey();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent,
              Colors.white60
            ],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter
          )
        ),
        child: Center(
          child: OutlinedButton(
            onPressed: () {
              signInWithGoogle()
                  .then((value) =>
                  Navigator.of(context)
                      .pushReplacementNamed("/nextscreen")
                  .catchError((onError) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(title: Text(onError.toString()));
                    });
              }));
            },
            child: Text("Sign in With Google"),
          ),
        ),
      ),
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleAuth != null) {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      var userCredentials =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // Once signed in, return the UserCredential
      return userCredentials;
    }
  }

}
