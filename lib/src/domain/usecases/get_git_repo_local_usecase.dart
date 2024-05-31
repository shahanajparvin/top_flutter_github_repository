import 'package:top_flutter_repo/src/domain/entities/local_response_entity.dart';
import 'package:top_flutter_repo/src/domain/repositories/git_repo_local_repository.dart';


class GetGitReposLocalUseCase{
  GetGitReposLocalUseCase(this.localRepository);

  final GitRepoLocalRepository localRepository;

  Future<LocalResponseEntity?> geGitReposLocalResponse(int page) {
    return localRepository.geGitReposLocalResponse(page);
  }

}