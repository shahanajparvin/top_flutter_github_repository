import 'package:floor/floor.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/utils/constants/const.dart';

@dao
abstract class SaveItemDao {
  @Query('SELECT * FROM $itemsTableName')
  Future<List<GitRepoEntity>> getAllItems();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertItem(GitRepoEntity item);

  @delete
  Future<void> deleteItem(GitRepoEntity item);
}
