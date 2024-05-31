import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:top_flutter_repo/src/data/dto/git_repos_response.dart';
import 'package:top_flutter_repo/src/utils/constants/const.dart';



part 'git_repos_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class GitReposApiService {
  factory GitReposApiService(Dio dio, {String baseUrl}) = _GitReposApiService;

  @GET(Apis.repoList)
  Future<HttpResponse<GitReposResponse>> getGitRepoItems({
    @Query("q") String? query,
    @Query("sort") String? sort,
    @Query("order") String? order,
    @Query("page") int? page,
    @Query("per_page") int? pageSize,
  });
}


