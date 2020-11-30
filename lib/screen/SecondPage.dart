import 'package:flutter/material.dart';
import 'package:pomodoro_timer/model/IssueItem.dart';
import 'package:pomodoro_timer/provider/IssueProvider.dart';
import 'package:pomodoro_timer/screen/AddIssuePage.dart';
import 'package:pomodoro_timer/widget/issue_list.dart';
import 'package:provider/provider.dart';

import '../database.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final issueProvider = Provider.of<IssueProvider>(context, listen: false);

    void _goAddIssue() => Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddIssuePage()));

    return Scaffold(
      appBar: AppBar(title: Text('Second')),
      body: IssueList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _goAddIssue,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
