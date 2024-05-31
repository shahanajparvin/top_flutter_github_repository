

import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';

abstract class SavedGitRepoRepository{

  Future<List<GitRepoEntity>> getSavedItems();

  Future<void> saveItem(GitRepoEntity item);

  Future<void> removeItem(GitRepoEntity item);
}
