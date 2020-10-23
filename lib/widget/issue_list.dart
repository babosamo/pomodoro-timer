import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pomodoro_timer/model/Count.dart';
import 'package:pomodoro_timer/provider/IssueProvider.dart';
import 'package:provider/provider.dart';

class IssueList extends StatefulWidget {
  @override
  _IssueListState createState() => _IssueListState();
}

class _IssueListState extends State<IssueList> {
  
  @override
  Widget build(BuildContext context) {
    
    final counter = Provider.of<Counter>(context);
    
    return Consumer<IssueProvider>(builder: (context, provider, child) {
      if (provider.list != null) {
        return ListView(
            scrollDirection: Axis.vertical,
            children: provider.list
                .map(
                  (issue) => ListTile(
                    leading: Icon(Icons.create),
                    title: Text(issue.name),
                    onTap: () => {
                      provider.setSelectedIssue(issue),
                      counter.setInitCount(issue.estimateTime.toInt()),
                      Navigator.pop(context)
                    },
                  ),
                )
                .toList());
      } else {
        return Text("리스트 없음");
      }
    });
  }
}
