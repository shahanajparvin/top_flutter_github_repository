import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/presentation/widgets/widget.dart';



class GitRepoItemWidget extends StatelessWidget {
  final GitRepoEntity item;
  final bool isRemovable;
  final void Function(GitRepoEntity item)? onRemove;
  final void Function(GitRepoEntity item)? onItemPressed;

  const GitRepoItemWidget({
    Key? key,
    required this.item,
    this.onItemPressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Stack(
          children: [
            Row(
              children: [
                _buildImage(context),
                _buildTitleAndDescription(),
              ],
            ),
            _buildRemovableArea(),
          ],
        ),
      ),
    );
  }



  Widget _buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.08),
          ),
          child: Image.network(
            item.owner?.avatarUrl ?? '',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return const Center(
                child: Text(
                  '404\nNOT FOUND',
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              item.name ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  item.description ?? '',
                  maxLines: 2,
                ),
              ),
            ),
            Row(
              children: [
                Row(children: [
                  const Icon(Icons.remove_red_eye_outlined),
                  Gap(5),
                  Text(item.watchers.toString())

                ]),
                const Spacer(),
                Row(children: [
                  const Icon(Icons.star_border),
                  Gap(5),
                  Text(item.stargazersCount  .toString())

                ]),
              ],
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
      ),
    );
  }

  Widget _buildRemovableArea() {
    if (isRemovable) {
      return Positioned(
        bottom: 10,
        right: 0,
        child:GestureDetector(
        onTap: _onRemove,
        child:   const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Ionicons.trash_outline, color: Colors.red),
        )),
      );
    }
    return const SizedBox();
  }

  void _onTap() {
    if (onItemPressed != null) {
      onItemPressed?.call(item);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove?.call(item);
    }
  }
}
