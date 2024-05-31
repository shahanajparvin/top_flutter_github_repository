import 'dart:async';
import 'dart:convert';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/domain/entities/local_response_entity.dart';
import 'package:top_flutter_repo/src/domain/usecases/get_git_repo_local_usecase.dart';
import 'package:top_flutter_repo/src/domain/usecases/insert_git_repo_local_usecase.dart';





class LocalResponseCubit{
  final GetGitReposLocalUseCase getGitReposLocalUseCase;
  final InsertGitReposLocalUseCase insertGitReposLocalUseCase;

  LocalResponseCubit({required this.getGitReposLocalUseCase, required this.insertGitReposLocalUseCase});



  Future<void> insertItem({required LocalResponseEntity response}) async {
    await insertGitReposLocalUseCase.insertResponse(response);
    //emit(await _getAllSavedResponse());
  }

  Future<LocalResponseEntity?> getResponsePerPage(int page) async {
    final response = await getGitReposLocalUseCase.geGitReposLocalResponse(page);
    return response;
  }

  // Function to decode JSON string to a list of Item objects
  List<GitRepoEntity> decodeItemList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => GitRepoEntity.fromMap(json)).toList();
  }

// Function to encode a list of Item objects to a JSON string
  String encodeItemList(List<GitRepoEntity> itemList) {
    final List<Map<String, dynamic>> jsonList = itemList.map((item) => item.toMap()).toList();
    return jsonEncode(jsonList);
  }
}
