import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oktoast/oktoast.dart';
import 'package:top_flutter_repo/src/config/router/app_router.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/presentation/cubits/local_data/save_git_repo_cubit.dart';
import 'package:top_flutter_repo/src/presentation/widgets/widget.dart';

class GitRepoDetailsView extends HookWidget {
  final GitRepoEntity item;

  const GitRepoDetailsView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localItemsCubit = BlocProvider.of<SaveGitRepoCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => appRouter.pop(),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildItemTitleAndDate(),
            _buildItemImage(),
            _buildItemDescription(),
            _buildItemForkWatchStar()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          localItemsCubit.saveItem(item: item);
          showToast('GitHub Repository Saved Successfully',
              position: ToastPosition.bottom);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Ionicons.bookmark, color: Colors.white),
      ),
    );
  }

  Widget _buildItemTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name ?? '',
            style: const TextStyle(
              fontFamily: 'Butler',
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Gap(10),
          Row(
            children: [
              const Icon(Ionicons.time_outline, size: 16),
              const SizedBox(width: 4),
              DateWidget(
                dateString: item.updatedAt ?? '',
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemImage() {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(
        item.owner?.avatarUrl ?? '',
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }

  Widget _buildItemDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Text(
        '${item.description}\n\n${item.topics}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildItemForkWatchStar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        child: Row(children: [
          Row(children: [
            const Icon(Icons.fork_left),
            const Gap(5),
            Text('${item.forks} forks')
          ]),
          const Spacer(),
          Row(children: [
            const Icon(Icons.remove_red_eye_outlined),
            const Gap(5),
            Text('${item.forks} forks')
          ]),
          const Spacer(),
          Row(children: [
            const Icon(Icons.star_border),
            const Gap(5),
            Text('${item.stargazersCount} start')
          ])
        ]));
  }
}
