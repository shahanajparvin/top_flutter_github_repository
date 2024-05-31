import 'package:top_flutter_repo/src/data/datasources/remote/git_repos_api_service.dart';
import 'package:top_flutter_repo/src/data/dto/git_repos_request.dart';
import 'package:top_flutter_repo/src/data/dto/git_repos_response.dart';
import 'package:top_flutter_repo/src/domain/repositories/git_repo_api_repository.dart';
import 'package:top_flutter_repo/src/utils/resources/data_state.dart';

import 'base/base_api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements GitRepoApiRepository {
  final GitReposApiService _reposApiService;

  ApiRepositoryImpl(this._reposApiService);

  @override
  Future<DataState<GitReposResponse>> geGitReposApiResponse({
    required GitReposRequest request,
  }) {
    return getStateOf<GitReposResponse>(
      request: () => _reposApiService.getGitRepoItems(
        query: request.query,
        sort: request.sort,
        page: request.page,
        pageSize: request.pageSize,
        order: request.order
      ),
    );
  }
}
