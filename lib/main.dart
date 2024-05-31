import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_flutter_repo/src/config/router/app_router.dart';
import 'package:top_flutter_repo/src/domain/repositories/saved_git_repo_repository.dart';
import 'package:top_flutter_repo/src/locator.dart';
import 'package:top_flutter_repo/src/presentation/cubits/data_fetch/data_fetch_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/internet/internet_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/internet/internet_visibility_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/local_data/local_response_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/local_data/save_git_repo_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/remote_data/remote_response_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/sort/sort_value_save_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/sort/sort_visibilty_toggle_cubit.dart';
import 'package:top_flutter_repo/src/utils/constants/const.dart';
import 'package:oktoast/oktoast.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataFetchCubit(
            remoteResponseCubit:locator<RemoteResponseCubit>(),
            localResponseCubit: locator<LocalResponseCubit>(),
            internetCubit: locator<InternetCubit>()
          )..fetchData(),
        ),
        BlocProvider(
          create: (context) => SaveGitRepoCubit(
            locator<SavedGitRepoRepository>(),
          )..getAllSavedItems(),
        ),
        BlocProvider(
          create: (context) => SortSectionVisibilityCubit(),
        ),

        BlocProvider(
          create: (context) => SortingValueSaveCubit()..getSortingOption()
        ),

        BlocProvider<InternetCubit>(
            create: (_) => InternetCubit(connectivity: Connectivity())),

        BlocProvider<InternetVisibilityCubit>(
            create: (_) => InternetVisibilityCubit()),
      ],
      child: OKToast(
    /// set toast style, optional
    child:MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        title: appTitle,
      )),
    );
  }
}

