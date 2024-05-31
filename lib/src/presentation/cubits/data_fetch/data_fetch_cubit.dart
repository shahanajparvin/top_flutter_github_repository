import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:oktoast/oktoast.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/domain/entities/local_response_entity.dart';
import 'package:top_flutter_repo/src/presentation/cubits/base/base_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/internet/internet_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/local_data/local_response_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/remote_data/remote_response_cubit.dart';


import 'package:top_flutter_repo/src/utils/constants/const.dart';
import 'package:top_flutter_repo/src/utils/resources/data_state.dart';


part 'data_fetch_state.dart';

class DataFetchCubit extends BaseCubit<DataFetchState, List<GitRepoEntity>> {
  final RemoteResponseCubit remoteResponseCubit;
  final LocalResponseCubit localResponseCubit;
  final InternetCubit internetCubit;


  DataFetchCubit({required this.remoteResponseCubit, required this.localResponseCubit,required this.internetCubit})
      : super( const DataFetchLoading(), []);

  int _page = 1;



  Future<void> fetchData() async {
    bool isConnected = await internetCubit.checkInternetConnectivity();
    if (!isConnected) {
      await getGitHubReposItemsFromDatabase(); // Fetch from database if no internet
    } else {
      await getGitHubReposItemsFromApi(); // Fetch from API if internet is available
    }
  }



  Future<void> getGitHubReposItemsFromDatabase() async {
    if (isBusy) return;
    await run(() async {
      LocalResponseEntity? itemsString = await localResponseCubit.getResponsePerPage(_page);
      if(itemsString!=null){
        List<GitRepoEntity> items = localResponseCubit.decodeItemList(itemsString.response);
        final noMoreData = items.length < defaultPageSize;
        data.addAll(items);
        _page++;
        emit( const DataFetchInitial());
        emit(DataFetchSuccess(items: data, noMoreData: noMoreData));
      }else{
        emit( const DataFetchInitial());
        emit(DataFetchSuccess(items: data, noMoreData: false));
      }
    });
  }

  Future<void> getGitHubReposItemsFromApi({String? sortValue}) async {
    if (isBusy) return;
    await run(() async {
      final response = await remoteResponseCubit.getGitHubReposItems(page: _page,sortValue: sortValue ?? defaultSort);
      if (response is DataSuccess) {
        List<GitRepoEntity> items = response.data!.items;
        final noMoreData = items.length < defaultPageSize;
        data.addAll(items);
        _page++;
        emit( const DataFetchInitial());
        emit(DataFetchSuccess(items: data, noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(DataFetchFailed(error: response.error));
      }
    });
  }

  resetData(){
    data.clear();
    _page = 1;
    emit(const DataFetchLoading());
  }

  DateTime? _lastRefreshTime; // Maintain timestamp of last refresh

  Future<void> refreshData() async {
    if (_lastRefreshTime == null ||
        DateTime.now().difference(_lastRefreshTime!) >= const Duration(minutes: 30)) {
      try {
        _lastRefreshTime = DateTime.now(); // Update last refresh timestamp
      } catch (e) {
      }
    }else{
      if(_getTimeLeftText().isNotEmpty){
        showToast(_getTimeLeftText(),position: ToastPosition.bottom);
      }
    }
  }

  String _getTimeLeftText() {
    if (_lastRefreshTime != null) {
      DateTime nextRefreshTime = _lastRefreshTime!.add(Duration(minutes: 30));
      Duration timeLeft = nextRefreshTime.difference(DateTime.now());
      int minutesLeft = timeLeft.inMinutes % 60;
      return 'Next refresh possible after $minutesLeft minutes later';
    } else {
      return '';
    }
  }
}