import 'package:flutter/material.dart';
import 'package:pomodoro_timer/model/Count.dart';
import 'package:pomodoro_timer/model/IssueItem.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    List<IssueItem> _list = [
      IssueItem("POMODORO-1", "백그라운드 타이머 기능", 30.0),
      IssueItem("POMODORO-2", "이동 감지", 120.0),
      IssueItem("POMODORO-3", "이슈 리스트 등록하기", 15.0),
      IssueItem("POMODORO-4", "이슈 리스트 뷰", 45.0)
    ];

    return Scaffold(
        appBar: AppBar(title: Text('Second')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('이전 페이지로'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Text("${counter.getCounter()}"),
              Container(
                  height: 500,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: _list
                        .map((issue) => ListTile(
                            leading: Icon(Icons.create),
                            title: Text(issue.name)))
                        .toList(),
                  ))
            ]));
  }
}
