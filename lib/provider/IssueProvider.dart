import 'package:flutter/widgets.dart';
import 'package:pomodoro_timer/model/IssueItem.dart';

import '../database.dart';


class IssueProvider with ChangeNotifier {

  List<IssueItem> _list = List();
  IssueItem _selectedIssue;

  Future<AppDatabase> db = AppDatabase.getInstance();

  IssueProvider(){
    db.then((database) => database.issueItemDao.findAllIssueItem().then((value) => _list = value));
  }

  void setSelectedIssue(IssueItem item) {
    _selectedIssue = item;
    notifyListeners();
  }

  IssueItem get selectedIssue => _selectedIssue;

  List<IssueItem> get list => _list;

  void addIssueItem(IssueItem value) {
    print("addIssueItem $value");
    _list.add(value);
    notifyListeners();
  }
}