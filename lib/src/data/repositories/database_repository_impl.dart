import 'package:top_flutter_repo/src/data/datasources/local/app_database.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/domain/entities/local_response_entity.dart';
import 'package:top_flutter_repo/src/domain/repositories/git_repo_local_repository.dart';
import 'package:top_flutter_repo/src/domain/repositories/saved_git_repo_repository.dart';




class DatabaseRepositoryImpl implements GitRepoLocalRepository, SavedGitRepoRepository
{
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<GitRepoEntity>> getSavedItems() async {
    return _appDatabase.itemDao.getAllItems();
  }

  @override
  Future<void> removeItem(GitRepoEntity item) async {
    return _appDatabase.itemDao.deleteItem(item);
  }

  @override
  Future<void> saveItem(GitRepoEntity item) async {
    return _appDatabase.itemDao.insertItem(item);
  }

  @override
  Future<LocalResponseEntity?> geGitReposLocalResponse(int page) {
    return _appDatabase.responseDao.findResponseByPage(page);
  }

  @override
  Future<void> insertResponse(LocalResponseEntity responseEntity) {
    return _appDatabase.responseDao.insertResponse(responseEntity);
  }


}
