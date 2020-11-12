import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pomodoro_timer/model/IssueItem.dart';
import 'package:pomodoro_timer/provider/IssueProvider.dart';
import 'package:provider/provider.dart';

class IssueMenu extends StatefulWidget {
  @override
  _IssueMenuState createState() => _IssueMenuState();
}

class _IssueMenuState extends State<IssueMenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IssueProvider>(builder: (context, issueProvider, child) {
      if (issueProvider.selectedIssue == null) {
        return Text("선택된 이슈가 없음");
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("타이틀    : ${issueProvider.selectedIssue.name}"),
            Text("이슈상태 : ${IssueItem.getIssueName(issueProvider.selectedIssue)}"),
            Text("예상시간 : ${issueProvider.selectedIssue.estimateTime}"),
          ],
        );
      }
    });
  }
}
