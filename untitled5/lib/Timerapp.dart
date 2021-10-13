import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TimerApp extends StatefulWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  static const duration=const Duration(seconds: 1);
  int secondspassed=0;
  bool isActive=false;
   Timer? timer;
  void handleTick(){
    if(isActive){
      setState(() {
        secondspassed=secondspassed+1;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    if(timer==null){
      timer=Timer.periodic(duration, (Timer t) {
       handleTick();
      });
    }
    int seconds =secondspassed % 60;
    int minutes=secondspassed~/60;
    int hours=secondspassed~/(60*60);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Coundown Timer"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabelText(
                    label:'HRS',value:hours.toString().padLeft(2,'0')
                  ),
                  LabelText(
                      label:'MIN',value:minutes.toString().padLeft(2,'0')
                  ),
                  LabelText(
                      label:'SECONDS',value:seconds.toString().padLeft(2,'0')
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 200,
                height: 40,
                margin: EdgeInsets.only(top: 30),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),),
                  child: Text(isActive?'Stop':'Start'),
                  onPressed: (){
                    setState(() {
                      isActive=!isActive;
                    });
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget{
  LabelText({required this.label,required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blueAccent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$value',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          Text('$label',style: TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
