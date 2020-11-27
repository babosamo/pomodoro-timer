
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro_timer/model/IssueItem.dart';
import 'package:pomodoro_timer/provider/IssueProvider.dart';
import 'package:provider/provider.dart';

class AddIssuePage extends StatefulWidget {
  @override
  _AddIssuePage createState() => _AddIssuePage();
}

class _AddIssuePage extends State<AddIssuePage> {

  TimeUnit _selectedTimeUnit = TimeUnit.HOUR;
  List<IssueState> _valueStateList = IssueState.values;
  IssueState _selectedValue = IssueState.OPEN;

  @override
  Widget build(BuildContext context) {

    final issueProvider = Provider.of<IssueProvider>(context, listen: false);

    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final timeController = TextEditingController();

    double _getEstimateTime() {
      String timeString = timeController.text;
      switch (_selectedTimeUnit) {
        case TimeUnit.HOUR:
          return double.parse(timeString) * 60;
        case TimeUnit.DAY:
          return double.parse(timeString) * 60 * 24;
        case TimeUnit.MINUTE:
          return double.parse(timeString);
      }
    }

    void _addIssue() {
      var item = IssueItem(
          timeController.text, descriptionController.text, _getEstimateTime());
      // error 처리 필요함
      print("${item.name} , ${item.description}, ${item.estimateTime}");
      issueProvider.addIssueItem(item);
    }

    return Scaffold(
        appBar: AppBar(title: Text('이 슈 등 록')),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '이슈명',
                        )),
                    TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '이슈 설명',
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
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                    ),
                    Container(
                        height: 60, // 높이를 360으로 지정
                        child: Row(children: <Widget>[
                          Expanded(
                            child: TextField(
                                controller: timeController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: '예측 시간')),
                          ),
                          DropdownButton(
                            value: _selectedTimeUnit,
                            items: TimeUnit.values.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedTimeUnit = value;
                              });
                            },
                          ),
                        ])),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 10),
                        height: 50,
                        child: OutlineButton(
                          child: Text('입 력'),
                          onPressed: _addIssue,
                        ))
                  ],
                )
              ]),
        ));
  }
}
