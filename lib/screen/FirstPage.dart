import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro_timer/model/Count.dart';
import 'package:pomodoro_timer/widget/issue_menu.dart';
import 'package:provider/provider.dart';

import 'SecondPage.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Timer _timer;

  void _incrementCounter() {
    // move next page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecondPage()));
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    // final issueProvider = Provider.of<IssueProvider>(context);

    void _startTimer() {
      if (_timer == null) {
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            counter.increase();
          });
        });
      } else {
        if (_timer.isActive) {
          _timer.cancel();
          _timer = null;
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IssueMenu(),
            // Text("가나다라나  ${issueProvider.selectedIssue?.name}"),
            Text(
              '${counter.getCounter()}',
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(
                icon: Icon(Icons.access_alarm),
                color: Colors.red,
                iconSize: 200.0,
                onPressed: _startTimer)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


