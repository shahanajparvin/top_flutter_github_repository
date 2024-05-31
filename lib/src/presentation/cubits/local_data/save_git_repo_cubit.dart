import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/domain/repositories/saved_git_repo_repository.dart';



part 'save_git_repo_state.dart';

class SaveGitRepoCubit extends Cubit<SaveGitRepoState> {
  final SavedGitRepoRepository savedGitRepoRepository;

  SaveGitRepoCubit(this.savedGitRepoRepository)
      : super(const SaveItemsLoading());

  Future<void> getAllSavedItems() async {
    emit(await _getAllSavedItems());
  }

  Future<void> removeItem({required GitRepoEntity item}) async {
    await savedGitRepoRepository.removeItem(item);
    emit(await _getAllSavedItems());
  }

  Future<void> saveItem({required GitRepoEntity item}) async {
    await savedGitRepoRepository.saveItem(item);
    emit(await _getAllSavedItems());
  }

  Future<SaveGitRepoState> _getAllSavedItems() async {
    final items = await savedGitRepoRepository.getSavedItems();
    return SaveItemsSuccess(items: items);
  }
}
