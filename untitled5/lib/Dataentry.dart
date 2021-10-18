import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Dataentry extends StatefulWidget {

  const Dataentry({Key? key}) : super(key: key);

  @override
  _DataentryState createState() => _DataentryState();
}

class _DataentryState extends State<Dataentry> {
  bool startispressed=true;
  bool stopispressed=true;
  void startstopwatch(){

  }
  void stopstopwatch(){

  }
  final pattern1 = DateFormat('E.HH:mm.');
@override
  Widget build(BuildContext context) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
  appBar: AppBar(
  title: Text('Date entry'), backgroundColor: Colors.blue,
  centerTitle: true,
  ),
  body: Column(
  children: [
    Padding(padding: EdgeInsets.only(left: 20),
  child: ListTile(
  title: Text('${pattern1.format(DateTime.now())}'),
  subtitle: Text('${pattern1.format(DateTime.now())}'),
  ),
    ),
  Divider(
  height: 10,
  ),
    Padding(padding: EdgeInsets.only(left: 60),
      child: ListTile(
      title: Text("00:00:00",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700,),),
    ),
    ),
  ]
  ),
floatingActionButton: FloatingActionButton(onPressed: (){},
child: Icon(Icons.play_arrow),
),
  ),
  );
}
}

