import 'package:auto_route/auto_route.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/presentation/views/views.dart';
import 'package:flutter/material.dart';


part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: GitHubReposView, initial: true),
    AutoRoute(page: GitRepoDetailsView),
    AutoRoute(page: SavedItemsView),
  ]
)
class AppRouter extends _$AppRouter {}

final appRouter = AppRouter();
