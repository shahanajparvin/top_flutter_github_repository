part of 'data_fetch_cubit.dart';

abstract class DataFetchState extends Equatable {
  final List<GitRepoEntity> items;
  final bool noMoreData;
  final DioException? error;

  const DataFetchState({
    this.items = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [items, noMoreData, error];
}


class DataFetchInitial extends DataFetchState {
  const DataFetchInitial();
}

class DataFetchLoading extends DataFetchState {
  const DataFetchLoading();
}

class DataFetchSuccess extends DataFetchState {
  const DataFetchSuccess({super.items, super.noMoreData});
}

class DataFetchFailed extends DataFetchState {
  const DataFetchFailed({super.error});
}
