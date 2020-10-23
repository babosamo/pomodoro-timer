import 'package:flutter/material.dart';
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IssueMenu(),
            SizedBox(height: 20),
            CountDownTimerView()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


