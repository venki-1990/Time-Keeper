import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:untitled5/Dataentry.dart';
class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);
  @override
  _NextScreenState createState() => _NextScreenState();
}
class _NextScreenState extends State<NextScreen> {
  @override
  Future<void> inistate() async {
  }
  Future<void>_selectedDate(BuildContext context )async{
  }
  void onItemTapped(int index){
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
      onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Dataentry()));
      },),
    );
  }
}





