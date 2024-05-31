import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';


abstract class BaseItemsState extends Equatable {
  final List<GitRepoEntity> items;
  final bool noMoreData;
  final DioException? error;

   const BaseItemsState({
    this.items = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [items, noMoreData, error];
}

class BaseItemsInitial extends BaseItemsState {
  const BaseItemsInitial();
}

class BaseItemsLoading extends BaseItemsState {
   const BaseItemsLoading();
}

class BaseItemsSuccess extends BaseItemsState {
   const BaseItemsSuccess({super.items, super.noMoreData});
}

class BaseItemsFailed extends BaseItemsState {
   const BaseItemsFailed({super.error});
}
