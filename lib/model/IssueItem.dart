class IssueItem {
  String _name;
  String _description;
  double _estimateTime; // minute
  double _logTime = 0.0; // minute
  IssueState issueState = IssueState.OPEN;
  WorkLog workLog;

  IssueItem(this._name, this._description, this._estimateTime);

  double get logTime => _logTime;

  set logTime(double value) {
    _logTime = value;
  }

  double get estimateTime => _estimateTime;

  set estimateTime(double value) {
    _estimateTime = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}

enum IssueState{
  OPEN,
  IN_PROGRESS,
  RESOLVED,
  CLOSED
}

class WorkLog{

}