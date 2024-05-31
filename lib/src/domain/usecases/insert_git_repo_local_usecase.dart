import 'package:top_flutter_repo/src/domain/entities/local_response_entity.dart';
import 'package:top_flutter_repo/src/domain/repositories/git_repo_local_repository.dart';


class InsertGitReposLocalUseCase{
  InsertGitReposLocalUseCase(this.localRepository);

  final GitRepoLocalRepository localRepository;

  Future<void> insertResponse(LocalResponseEntity responseEntity) {
    return localRepository.insertResponse(responseEntity);
  }

}