import 'package:flutter/widgets.dart';
import 'package:pomodoro_timer/model/IssueItem.dart';

class IssueProvider with ChangeNotifier {

  List<IssueItem> _list;
  IssueItem _selectedIssue;

  void setSelectedIssue(IssueItem item) {
    _selectedIssue = item;
    notifyListeners();
  }

  IssueItem get selectedIssue => _selectedIssue;

  List<IssueItem> get list => _list;

  set list(List<IssueItem> value) {
    _list = value;
  }

  void addIssueItem(IssueItem value) {
    _list.add(value);
    notifyListeners();
  }
}