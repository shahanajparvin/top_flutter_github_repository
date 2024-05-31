import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:top_flutter_repo/src/data/datasources/local/app_database.dart';
import 'package:top_flutter_repo/src/data/datasources/remote/git_repos_api_service.dart';
import 'package:top_flutter_repo/src/data/repositories/api_repository_impl.dart';
import 'package:top_flutter_repo/src/data/repositories/database_repository_impl.dart';
import 'package:top_flutter_repo/src/domain/repositories/git_repo_api_repository.dart';
import 'package:top_flutter_repo/src/domain/repositories/git_repo_local_repository.dart';
import 'package:top_flutter_repo/src/domain/repositories/saved_git_repo_repository.dart';
import 'package:top_flutter_repo/src/domain/usecases/get_git_repo_api_usecase.dart';
import 'package:top_flutter_repo/src/domain/usecases/get_git_repo_local_usecase.dart';
import 'package:top_flutter_repo/src/domain/usecases/insert_git_repo_local_usecase.dart';
import 'package:top_flutter_repo/src/presentation/cubits/internet/internet_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/local_data/local_response_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/remote_data/remote_response_cubit.dart';
import 'package:top_flutter_repo/src/utils/constants/const.dart';



final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);

  final dio = Dio();
//  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);


  //datasource

  locator.registerSingleton<GitReposApiService>(GitReposApiService(locator<Dio>()),);

  //Repository

  locator.registerLazySingleton<GitRepoApiRepository>(() => ApiRepositoryImpl(locator()));
  locator.registerLazySingleton<GitRepoLocalRepository>(() => DatabaseRepositoryImpl(locator()));
  locator.registerLazySingleton<SavedGitRepoRepository>(() => DatabaseRepositoryImpl(locator()));

  //usecase

  locator.registerFactory(() => GetGitReposApiUseCase(locator.get()));
  locator.registerFactory(() => GetGitReposLocalUseCase(locator.get()));
  locator.registerFactory(() => InsertGitReposLocalUseCase(locator.get()));



  locator.registerSingleton<LocalResponseCubit>(LocalResponseCubit(
    getGitReposLocalUseCase: locator(),
    insertGitReposLocalUseCase: locator(),
  ));

  locator.registerSingleton<RemoteResponseCubit>(RemoteResponseCubit(
    getGitReposApiUseCase: locator(),
  ));

  locator.registerSingleton<InternetCubit>(InternetCubit(connectivity: Connectivity()));


}
