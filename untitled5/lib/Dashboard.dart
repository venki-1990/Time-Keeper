import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled5/Timerapp.dart';
class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);
  @override
  _NextScreenState createState() => _NextScreenState();
}
class _NextScreenState extends State<NextScreen> {
  @override
  Future<void> inistate() async {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 130),
        child: Column(
          children: [
              SizedBox(
                    height: 60,
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
                      RaisedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TimerApp()));
                      },
                        child: Text("Timer",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                      )
                    ],
              ),

          ],
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





