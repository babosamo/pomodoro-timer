import 'package:flutter/material.dart';
import 'package:pomodoro_timer/model/IssueItem.dart';
import 'package:pomodoro_timer/provider/IssueProvider.dart';
import 'package:pomodoro_timer/screen/AddIssuePage.dart';
import 'package:pomodoro_timer/widget/issue_list.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<IssueItem> _list = [
      IssueItem("POMODORO-1", "백그라운드 타이머 기능", 30.0),
      IssueItem("POMODORO-2", "이동 감지", 120.0),
      IssueItem("POMODORO-3", "이슈 리스트 등록하기", 15.0),
      IssueItem("POMODORO-4", "이슈 리스트 뷰", 45.0)
    ];

    final issueProvider = Provider.of<IssueProvider>(context, listen: false);
    issueProvider.list = _list;

    void _goAddIssue() => Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddIssuePage()));

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
          Container(height: 500, child: IssueList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goAddIssue,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
