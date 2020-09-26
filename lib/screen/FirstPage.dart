import 'package:flutter/material.dart';
import 'package:pomodoro_timer/util/ColorUtil.dart';
import 'package:pomodoro_timer/view/CountDownTimerView.dart';
import 'package:pomodoro_timer/widget/issue_menu.dart';

import 'SecondPage.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void _incrementCounter() {
    // move next page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecondPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: HexColor("#ff5f42"),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [HexColor("#ff5f42"), HexColor("#ff0f53")]
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IssueMenu(),
              SizedBox(height: 30),
              CountDownTimerView()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#ff3b5b"),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


