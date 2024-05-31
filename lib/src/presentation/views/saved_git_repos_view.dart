import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:top_flutter_repo/src/config/router/app_router.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/presentation/cubits/local_data/save_git_repo_cubit.dart';
import 'package:top_flutter_repo/src/presentation/widgets/git_repo_item_widget.dart';





class SavedItemsView extends HookWidget {
  const SavedItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => appRouter.pop(),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
        title: const Text(
          'Saved Items',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<SaveGitRepoCubit, SaveGitRepoState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case SaveItemsLoading:
              return const Center(child: CupertinoActivityIndicator());
            case SaveItemsSuccess:
              return _buildItemsList(state.items);
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildItemsList(List<GitRepoEntity> items) {
    if (items.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED ItemS',
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GitRepoItemWidget(
          item: items[index],
          isRemovable: true,
          onRemove: (item) => BlocProvider.of<SaveGitRepoCubit>(context)
              .removeItem(item: item),
          onItemPressed: (item) => appRouter.push(
            GitRepoDetailsViewRoute(item: item),
          )
        );
      },
    );
  }
}
