import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStopWatch(),
    );
  }
}

class MyStopWatch extends StatefulWidget {
  const MyStopWatch({Key? key}) : super(key: key);

  @override
  _MyStopWatchState createState() => _MyStopWatchState();
}

class _MyStopWatchState extends State<MyStopWatch> {

  var text = 'blank';
  var prev;

  void startTimer(){
    setState(() {
      prev = new DateTime.now();
    });
  }

  void updateText(){
    setState(() {
      var now = new DateTime.now();
      var diff = now.difference(prev);
      prev = now;
      text = diff.toString();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(text),
              ElevatedButton(
                child: Text('Start'),
                onPressed: (){
                  startTimer();
                },
              ),
              ElevatedButton(
                child: Text('write'),
                onPressed: (){
                  updateText();
                },
              ),
              ElevatedButton(
                child: Text('End'),
                onPressed: (){

                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
