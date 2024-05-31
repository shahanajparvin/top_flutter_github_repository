// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    GitHubReposViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const GitHubReposView(),
      );
    },
    GitRepoDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<GitRepoDetailsViewRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: GitRepoDetailsView(
          key: args.key,
          item: args.item,
        ),
      );
    },
    SavedItemsViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SavedItemsView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          GitHubReposViewRoute.name,
          path: '/',
        ),
        RouteConfig(
          GitRepoDetailsViewRoute.name,
          path: '/git-repo-details-view',
        ),
        RouteConfig(
          SavedItemsViewRoute.name,
          path: '/saved-items-view',
        ),
      ];
}

/// generated route for
/// [GitHubReposView]
class GitHubReposViewRoute extends PageRouteInfo<void> {
  const GitHubReposViewRoute()
      : super(
          GitHubReposViewRoute.name,
          path: '/',
        );

  static const String name = 'GitHubReposViewRoute';
}

/// generated route for
/// [GitRepoDetailsView]
class GitRepoDetailsViewRoute
    extends PageRouteInfo<GitRepoDetailsViewRouteArgs> {
  GitRepoDetailsViewRoute({
    Key? key,
    required GitRepoEntity item,
  }) : super(
          GitRepoDetailsViewRoute.name,
          path: '/git-repo-details-view',
          args: GitRepoDetailsViewRouteArgs(
            key: key,
            item: item,
          ),
        );

  static const String name = 'GitRepoDetailsViewRoute';
}

class GitRepoDetailsViewRouteArgs {
  const GitRepoDetailsViewRouteArgs({
    this.key,
    required this.item,
  });

  final Key? key;

  final GitRepoEntity item;

  @override
  String toString() {
    return 'GitRepoDetailsViewRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [SavedItemsView]
class SavedItemsViewRoute extends PageRouteInfo<void> {
  const SavedItemsViewRoute()
      : super(
          SavedItemsViewRoute.name,
          path: '/saved-items-view',
        );

  static const String name = 'SavedItemsViewRoute';
}
