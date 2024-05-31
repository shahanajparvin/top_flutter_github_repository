import 'package:top_flutter_repo/src/data/dto/git_repos_request.dart';
import 'package:top_flutter_repo/src/data/dto/git_repos_response.dart';
import 'package:top_flutter_repo/src/domain/usecases/get_git_repo_api_usecase.dart';
import 'package:top_flutter_repo/src/utils/constants/const.dart';
import 'package:top_flutter_repo/src/utils/resources/data_state.dart';




class RemoteResponseCubit  {
  final GetGitReposApiUseCase getGitReposApiUseCase;

  RemoteResponseCubit({required this.getGitReposApiUseCase});

  Future<DataState<GitReposResponse>> getGitHubReposItems({required int page,String? sortValue}) async {
    final response = await getGitReposApiUseCase.geGitReposApiResponse(
      request: GitReposRequest(page: page,sort: sortValue ?? defaultSort),
    );
    return response;
  }

}
