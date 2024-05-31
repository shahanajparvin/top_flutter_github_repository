part of 'save_git_repo_cubit.dart';

abstract class SaveGitRepoState extends Equatable {
  final List<GitRepoEntity> items;

  const SaveGitRepoState({
    this.items = const [],
  });

  @override
  List<Object> get props => [items];
}

class SaveItemsLoading extends SaveGitRepoState {
  const SaveItemsLoading();
}

class SaveItemsSuccess extends SaveGitRepoState {
  const SaveItemsSuccess({super.items});
}
