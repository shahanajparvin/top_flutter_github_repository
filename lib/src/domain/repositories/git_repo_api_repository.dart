import 'package:top_flutter_repo/src/data/dto/git_repos_request.dart';
import 'package:top_flutter_repo/src/data/dto/git_repos_response.dart';
import 'package:top_flutter_repo/src/utils/resources/data_state.dart';

abstract class GitRepoApiRepository {
  Future<DataState<GitReposResponse>> geGitReposApiResponse({
    required GitReposRequest request,
  });
}


