import 'package:equatable/equatable.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';


class GitReposResponse extends Equatable {
  final int totalCount;
  final bool incompleteResult;
  final List<GitRepoEntity> items;

  const GitReposResponse({
    required this.totalCount,
    required this.incompleteResult,
    required this.items,
  });

  factory GitReposResponse.fromMap(Map<String, dynamic> map) {
    return GitReposResponse(
      totalCount: (map['total_count'] ?? '') as int,
      incompleteResult: (map['incomplete_results'] ?? false) as bool,
      items: List<GitRepoEntity>.from(
        map['items'].map<GitRepoEntity>(
              (x) => GitRepoEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [totalCount, incompleteResult, items];
}