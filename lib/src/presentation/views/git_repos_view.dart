import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:top_flutter_repo/src/config/router/app_router.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/presentation/cubits/data_fetch/data_fetch_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/sort/sort_visibilty_toggle_cubit.dart';
import 'package:top_flutter_repo/src/presentation/widgets/git_repo_item_widget.dart';
import 'package:top_flutter_repo/src/presentation/widgets/internet_status_widget.dart';
import 'package:top_flutter_repo/src/presentation/widgets/sort_widget.dart';
import 'package:top_flutter_repo/src/utils/constants/const.dart';
import 'package:top_flutter_repo/src/utils/extensions/scroll_controller_extensions.dart';

class GitHubReposView extends HookWidget {
  const GitHubReposView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fetchDataCubit = BlocProvider.of<DataFetchCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        fetchDataCubit.fetchData();
      });

      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () => appRouter.push(const SavedItemsViewRoute()),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Icons.bookmark_border, color: Colors.black),
            ),
          ),
          GestureDetector(
            onTap: () => context
                .read<SortSectionVisibilityCubit>()
                .toggleSortSectionVisibility(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Icons.sort, color: Colors.black),
            ),
          ),
        ],
      ),
      bottomSheet: const InternetStatusWidget(),
      body: RefreshIndicator(
          onRefresh: () async {
            fetchDataCubit.refreshData();
          },
          child: Stack(
            children: [
              BlocBuilder<DataFetchCubit, DataFetchState>(
                builder: (_, state) {
                  switch (state.runtimeType) {
                    case DataFetchLoading:
                      return const Center(child: CupertinoActivityIndicator());
                    case DataFetchFailed:
                      return const Center(child: Icon(Ionicons.refresh));
                    case DataFetchSuccess:
                      return BuildReposWidget(
                        scrollController:scrollController,
                        items:state.items,
                        noMoreData:state.noMoreData,
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
              SortWidget(
                onPress: (sortValue) {
                  context
                      .read<SortSectionVisibilityCubit>()
                      .toggleSortSectionVisibility();
                  fetchDataCubit.resetData();
                  fetchDataCubit.getGitHubReposItemsFromApi(
                      sortValue: sortValue);
                },
              )
            ],
          )),
    );
  }


  
}


class BuildReposWidget extends StatelessWidget {

 final  ScrollController scrollController;
 final   List<GitRepoEntity> items;
 final   bool noMoreData;

  const BuildReposWidget({super.key, required this.scrollController, required this.items, required this.noMoreData});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => GitRepoItemWidget(
              item: items[index],
              onItemPressed: (e) => appRouter.push(
                GitRepoDetailsViewRoute(item: e),
              ),
            ),
            childCount: items.length,
          ),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CupertinoActivityIndicator(),
            ),
          )
      ],
    );
  }
}

