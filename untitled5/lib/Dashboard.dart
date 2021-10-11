import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}
Future<void> signout() async {
  (await GoogleSignIn().signOut());
  return FirebaseAuth.instance.signOut();
}
class _NextScreenState extends State<NextScreen> {
  static const duration=const Duration();
  int secondsPassed=0;
  bool isActive=false;
  late final Timer timer;

  void handleTick(){
    if(isActive){
      setState(() {
        secondsPassed=secondsPassed+1;
      });
    }
  }
  DateTime selectedDate=DateTime.now();
  Future<void>_selectedDate(BuildContext context )async{
    final DateTime? picked= await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );
    if (picked!= null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  int _selectedIndex=0;
  void onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(timer==null){
      timer=Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds=secondsPassed %60;
    int minutes=secondsPassed ~/60;
    int hours=secondsPassed ~/(60*60);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Row(
            children:<Widget> [
              LabelText(
                label:"HRS",value:hours.toString().padLeft(2,'0')
              ),
              LabelText(
                  label:"MIN",value:hours.toString().padLeft(2,'0')
              ),
              LabelText(
                  label:"SEC",value:hours.toString().padLeft(2,'0')
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: RaisedButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  onPressed: (){
                    setState(() {
                      isActive=!isActive;
                    });
                  },
                  child: Text(isActive?'STOP':'START'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${selectedDate.day}/${selectedDate.month}/${selectedDate
                      .year}"),
                  OutlinedButton(
                    onPressed: () {
                      _selectedDate(context);
                    },
                    child: Text("Choose date",
                      style: TextStyle(fontWeight: FontWeight.bold,),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ("HOME")),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_edu), label: ("HISTORY")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: ("SETTINGS"))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
class LabelText extends StatelessWidget{
  LabelText({required this.label,required this.value});
  late final String label;
  late final String value;
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("$value",style:TextStyle(color: Colors.white,fontSize: 55,fontWeight: FontWeight.bold),),
          Text("$label",style:TextStyle(color: Colors.white70,fontSize: 55,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}

