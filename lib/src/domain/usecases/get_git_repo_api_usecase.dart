import 'package:top_flutter_repo/src/data/dto/git_repos_request.dart';
import 'package:top_flutter_repo/src/data/dto/git_repos_response.dart';
import 'package:top_flutter_repo/src/domain/repositories/git_repo_api_repository.dart';
import 'package:top_flutter_repo/src/utils/resources/data_state.dart';

class GetGitReposApiUseCase{
  GetGitReposApiUseCase(this.apiRepository);

  final GitRepoApiRepository apiRepository;

  Future<DataState<GitReposResponse>> geGitReposApiResponse(
      {required GitReposRequest request}) {
    return apiRepository.geGitReposApiResponse(request: request);
  }
}