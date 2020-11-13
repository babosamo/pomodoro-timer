import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro_timer/model/IssueItem.dart';
import 'package:pomodoro_timer/provider/IssueProvider.dart';
import 'package:pomodoro_timer/widget/issue_list.dart';
import 'package:provider/provider.dart';

class AddIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final issueProvider = Provider.of<IssueProvider>(context, listen: false);

    List<IssueState> _valueStateList = IssueState.values;
    IssueState _selectedValue = IssueState.OPEN;
    TimeUnit _selectedTimeUnit = TimeUnit.HOUR;

    return Scaffold(
      appBar: AppBar(title: Text('이 슈 등 록')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이슈명',
                )),
                DropdownButton(
                  value: _selectedValue,
                  items: _valueStateList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(IssueItem.getIssueStateName(value)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _selectedValue = value;
                  },
                ),
                Container(
                  height: 60, // 높이를 360으로 지정
                  child: Row(
                      children: <Widget>[
                        Expanded(child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '예측 시간')),),
                        DropdownButton(
                          value: _selectedTimeUnit,
                          items: TimeUnit.values.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _selectedTimeUnit = value;
                          },
                        ),

                      ]
                  )
                )
              ],
            )
          ]),
    );
  }
}
