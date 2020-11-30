import 'package:floor/floor.dart';

@entity
class IssueItem {

  @primaryKey
  String name;
  String description;
  double estimateTime; // minute
  double logTime = 0.0; // minute
  String issueState = IssueState.OPEN.toString();
  // WorkLog workLog;

  IssueItem(this.name, this.description, this.estimateTime);

  static String getIssueStateName(IssueState issueState) {
    switch (issueState) {
      case IssueState.OPEN:
        {
          return "OPEN";
        }
      case IssueState.IN_PROGRESS:
        {
          return "IN_PROGRESS";
        }
      case IssueState.RESOLVED:
        {
          return "RESOLVED";
        }
      case IssueState.CLOSED:
        {
          return "CLOSED";
        }
      default:
        {
          return "OPEN";
        }
    }
  }
}

enum IssueState { OPEN, IN_PROGRESS, RESOLVED, CLOSED }

enum TimeUnit { DAY, HOUR, MINUTE}

// class WorkLog {}
