
import 'package:top_flutter_repo/src/domain/entities/local_response_entity.dart';

abstract class GitRepoLocalRepository  {
  Future<LocalResponseEntity?> geGitReposLocalResponse(int page);
  Future<void> insertResponse(LocalResponseEntity item);
}