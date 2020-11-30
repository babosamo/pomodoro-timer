import 'package:floor/floor.dart';
import 'package:pomodoro_timer/model/IssueItem.dart';

@dao
abstract class IssueItemDao {
  @Query('SELECT * FROM IssueItem')
  Future<List<IssueItem>> findAllIssueItem();

  @Query('SELECT * FROM IssueItem WHERE id = :id')
  Future<IssueItem> findIssueItemById(int id);

  @insert
  Future<void> insertIssueItem(IssueItem issueItem);

  @update
  Future<int> updateIssueItemList(List<IssueItem> issueItemList);

  @update
  Future<int> updateIssueItem(IssueItem issueItem);


  @delete
  Future<int> deleteIssueItem(IssueItem issueItem);
}