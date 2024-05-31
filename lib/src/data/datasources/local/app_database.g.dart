// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SaveItemDao? _itemDaoInstance;

  LocalResponseDao? _responseDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `item_table` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `nodeId` TEXT, `name` TEXT, `fullName` TEXT, `private` INTEGER, `owner` TEXT, `htmlUrl` TEXT, `description` TEXT, `fork` INTEGER, `url` TEXT, `forksUrl` TEXT, `keysUrl` TEXT, `collaboratorsUrl` TEXT, `teamsUrl` TEXT, `hooksUrl` TEXT, `issueEventsUrl` TEXT, `eventsUrl` TEXT, `assigneesUrl` TEXT, `branchesUrl` TEXT, `tagsUrl` TEXT, `blobsUrl` TEXT, `gitTagsUrl` TEXT, `gitRefsUrl` TEXT, `treesUrl` TEXT, `statusesUrl` TEXT, `languagesUrl` TEXT, `stargazersUrl` TEXT, `contributorsUrl` TEXT, `subscribersUrl` TEXT, `subscriptionUrl` TEXT, `commitsUrl` TEXT, `gitCommitsUrl` TEXT, `commentsUrl` TEXT, `issueCommentUrl` TEXT, `contentsUrl` TEXT, `compareUrl` TEXT, `mergesUrl` TEXT, `archiveUrl` TEXT, `downloadsUrl` TEXT, `issuesUrl` TEXT, `pullsUrl` TEXT, `milestonesUrl` TEXT, `notificationsUrl` TEXT, `labelsUrl` TEXT, `releasesUrl` TEXT, `deploymentsUrl` TEXT, `createdAt` TEXT, `updatedAt` TEXT, `pushedAt` TEXT, `gitUrl` TEXT, `sshUrl` TEXT, `cloneUrl` TEXT, `svnUrl` TEXT, `homepage` TEXT, `size` INTEGER, `stargazersCount` INTEGER, `watchersCount` INTEGER, `language` TEXT, `hasIssues` INTEGER, `hasProjects` INTEGER, `hasDownloads` INTEGER, `hasWiki` INTEGER, `hasPages` INTEGER, `hasDiscussions` INTEGER, `forksCount` INTEGER, `archived` INTEGER, `disabled` INTEGER, `openIssuesCount` INTEGER, `license` TEXT, `allowForking` INTEGER, `isTemplate` INTEGER, `webCommitSignoffRequired` INTEGER, `topics` TEXT, `visibility` TEXT, `forks` INTEGER, `openIssues` INTEGER, `watchers` INTEGER, `defaultBranch` TEXT, `score` REAL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `response_table` (`page` INTEGER NOT NULL, `response` TEXT NOT NULL, PRIMARY KEY (`page`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SaveItemDao get itemDao {
    return _itemDaoInstance ??= _$SaveItemDao(database, changeListener);
  }

  @override
  LocalResponseDao get responseDao {
    return _responseDaoInstance ??=
        _$LocalResponseDao(database, changeListener);
  }
}

class _$SaveItemDao extends SaveItemDao {
  _$SaveItemDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _gitRepoEntityInsertionAdapter = InsertionAdapter(
            database,
            'item_table',
            (GitRepoEntity item) => <String, Object?>{
                  'id': item.id,
                  'nodeId': item.nodeId,
                  'name': item.name,
                  'fullName': item.fullName,
                  'private':
                      item.private == null ? null : (item.private! ? 1 : 0),
                  'owner': _ownerTypeConverter.encode(item.owner),
                  'htmlUrl': item.htmlUrl,
                  'description': item.description,
                  'fork': item.fork == null ? null : (item.fork! ? 1 : 0),
                  'url': item.url,
                  'forksUrl': item.forksUrl,
                  'keysUrl': item.keysUrl,
                  'collaboratorsUrl': item.collaboratorsUrl,
                  'teamsUrl': item.teamsUrl,
                  'hooksUrl': item.hooksUrl,
                  'issueEventsUrl': item.issueEventsUrl,
                  'eventsUrl': item.eventsUrl,
                  'assigneesUrl': item.assigneesUrl,
                  'branchesUrl': item.branchesUrl,
                  'tagsUrl': item.tagsUrl,
                  'blobsUrl': item.blobsUrl,
                  'gitTagsUrl': item.gitTagsUrl,
                  'gitRefsUrl': item.gitRefsUrl,
                  'treesUrl': item.treesUrl,
                  'statusesUrl': item.statusesUrl,
                  'languagesUrl': item.languagesUrl,
                  'stargazersUrl': item.stargazersUrl,
                  'contributorsUrl': item.contributorsUrl,
                  'subscribersUrl': item.subscribersUrl,
                  'subscriptionUrl': item.subscriptionUrl,
                  'commitsUrl': item.commitsUrl,
                  'gitCommitsUrl': item.gitCommitsUrl,
                  'commentsUrl': item.commentsUrl,
                  'issueCommentUrl': item.issueCommentUrl,
                  'contentsUrl': item.contentsUrl,
                  'compareUrl': item.compareUrl,
                  'mergesUrl': item.mergesUrl,
                  'archiveUrl': item.archiveUrl,
                  'downloadsUrl': item.downloadsUrl,
                  'issuesUrl': item.issuesUrl,
                  'pullsUrl': item.pullsUrl,
                  'milestonesUrl': item.milestonesUrl,
                  'notificationsUrl': item.notificationsUrl,
                  'labelsUrl': item.labelsUrl,
                  'releasesUrl': item.releasesUrl,
                  'deploymentsUrl': item.deploymentsUrl,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt,
                  'pushedAt': item.pushedAt,
                  'gitUrl': item.gitUrl,
                  'sshUrl': item.sshUrl,
                  'cloneUrl': item.cloneUrl,
                  'svnUrl': item.svnUrl,
                  'homepage': item.homepage,
                  'size': item.size,
                  'stargazersCount': item.stargazersCount,
                  'watchersCount': item.watchersCount,
                  'language': item.language,
                  'hasIssues':
                      item.hasIssues == null ? null : (item.hasIssues! ? 1 : 0),
                  'hasProjects': item.hasProjects == null
                      ? null
                      : (item.hasProjects! ? 1 : 0),
                  'hasDownloads': item.hasDownloads == null
                      ? null
                      : (item.hasDownloads! ? 1 : 0),
                  'hasWiki':
                      item.hasWiki == null ? null : (item.hasWiki! ? 1 : 0),
                  'hasPages':
                      item.hasPages == null ? null : (item.hasPages! ? 1 : 0),
                  'hasDiscussions': item.hasDiscussions == null
                      ? null
                      : (item.hasDiscussions! ? 1 : 0),
                  'forksCount': item.forksCount,
                  'archived':
                      item.archived == null ? null : (item.archived! ? 1 : 0),
                  'disabled':
                      item.disabled == null ? null : (item.disabled! ? 1 : 0),
                  'openIssuesCount': item.openIssuesCount,
                  'license': _licenseTypeConverter.encode(item.license),
                  'allowForking': item.allowForking == null
                      ? null
                      : (item.allowForking! ? 1 : 0),
                  'isTemplate': item.isTemplate == null
                      ? null
                      : (item.isTemplate! ? 1 : 0),
                  'webCommitSignoffRequired':
                      item.webCommitSignoffRequired == null
                          ? null
                          : (item.webCommitSignoffRequired! ? 1 : 0),
                  'topics': _topicsTypeConverter.encode(item.topics),
                  'visibility': item.visibility,
                  'forks': item.forks,
                  'openIssues': item.openIssues,
                  'watchers': item.watchers,
                  'defaultBranch': item.defaultBranch,
                  'score': item.score
                }),
        _gitRepoEntityDeletionAdapter = DeletionAdapter(
            database,
            'item_table',
            ['id'],
            (GitRepoEntity item) => <String, Object?>{
                  'id': item.id,
                  'nodeId': item.nodeId,
                  'name': item.name,
                  'fullName': item.fullName,
                  'private':
                      item.private == null ? null : (item.private! ? 1 : 0),
                  'owner': _ownerTypeConverter.encode(item.owner),
                  'htmlUrl': item.htmlUrl,
                  'description': item.description,
                  'fork': item.fork == null ? null : (item.fork! ? 1 : 0),
                  'url': item.url,
                  'forksUrl': item.forksUrl,
                  'keysUrl': item.keysUrl,
                  'collaboratorsUrl': item.collaboratorsUrl,
                  'teamsUrl': item.teamsUrl,
                  'hooksUrl': item.hooksUrl,
                  'issueEventsUrl': item.issueEventsUrl,
                  'eventsUrl': item.eventsUrl,
                  'assigneesUrl': item.assigneesUrl,
                  'branchesUrl': item.branchesUrl,
                  'tagsUrl': item.tagsUrl,
                  'blobsUrl': item.blobsUrl,
                  'gitTagsUrl': item.gitTagsUrl,
                  'gitRefsUrl': item.gitRefsUrl,
                  'treesUrl': item.treesUrl,
                  'statusesUrl': item.statusesUrl,
                  'languagesUrl': item.languagesUrl,
                  'stargazersUrl': item.stargazersUrl,
                  'contributorsUrl': item.contributorsUrl,
                  'subscribersUrl': item.subscribersUrl,
                  'subscriptionUrl': item.subscriptionUrl,
                  'commitsUrl': item.commitsUrl,
                  'gitCommitsUrl': item.gitCommitsUrl,
                  'commentsUrl': item.commentsUrl,
                  'issueCommentUrl': item.issueCommentUrl,
                  'contentsUrl': item.contentsUrl,
                  'compareUrl': item.compareUrl,
                  'mergesUrl': item.mergesUrl,
                  'archiveUrl': item.archiveUrl,
                  'downloadsUrl': item.downloadsUrl,
                  'issuesUrl': item.issuesUrl,
                  'pullsUrl': item.pullsUrl,
                  'milestonesUrl': item.milestonesUrl,
                  'notificationsUrl': item.notificationsUrl,
                  'labelsUrl': item.labelsUrl,
                  'releasesUrl': item.releasesUrl,
                  'deploymentsUrl': item.deploymentsUrl,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt,
                  'pushedAt': item.pushedAt,
                  'gitUrl': item.gitUrl,
                  'sshUrl': item.sshUrl,
                  'cloneUrl': item.cloneUrl,
                  'svnUrl': item.svnUrl,
                  'homepage': item.homepage,
                  'size': item.size,
                  'stargazersCount': item.stargazersCount,
                  'watchersCount': item.watchersCount,
                  'language': item.language,
                  'hasIssues':
                      item.hasIssues == null ? null : (item.hasIssues! ? 1 : 0),
                  'hasProjects': item.hasProjects == null
                      ? null
                      : (item.hasProjects! ? 1 : 0),
                  'hasDownloads': item.hasDownloads == null
                      ? null
                      : (item.hasDownloads! ? 1 : 0),
                  'hasWiki':
                      item.hasWiki == null ? null : (item.hasWiki! ? 1 : 0),
                  'hasPages':
                      item.hasPages == null ? null : (item.hasPages! ? 1 : 0),
                  'hasDiscussions': item.hasDiscussions == null
                      ? null
                      : (item.hasDiscussions! ? 1 : 0),
                  'forksCount': item.forksCount,
                  'archived':
                      item.archived == null ? null : (item.archived! ? 1 : 0),
                  'disabled':
                      item.disabled == null ? null : (item.disabled! ? 1 : 0),
                  'openIssuesCount': item.openIssuesCount,
                  'license': _licenseTypeConverter.encode(item.license),
                  'allowForking': item.allowForking == null
                      ? null
                      : (item.allowForking! ? 1 : 0),
                  'isTemplate': item.isTemplate == null
                      ? null
                      : (item.isTemplate! ? 1 : 0),
                  'webCommitSignoffRequired':
                      item.webCommitSignoffRequired == null
                          ? null
                          : (item.webCommitSignoffRequired! ? 1 : 0),
                  'topics': _topicsTypeConverter.encode(item.topics),
                  'visibility': item.visibility,
                  'forks': item.forks,
                  'openIssues': item.openIssues,
                  'watchers': item.watchers,
                  'defaultBranch': item.defaultBranch,
                  'score': item.score
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GitRepoEntity> _gitRepoEntityInsertionAdapter;

  final DeletionAdapter<GitRepoEntity> _gitRepoEntityDeletionAdapter;

  @override
  Future<List<GitRepoEntity>> getAllItems() async {
    return _queryAdapter.queryList('SELECT * FROM item_table',
        mapper: (Map<String, Object?> row) => GitRepoEntity(
            id: row['id'] as int?,
            nodeId: row['nodeId'] as String?,
            name: row['name'] as String?,
            fullName: row['fullName'] as String?,
            private:
                row['private'] == null ? null : (row['private'] as int) != 0,
            owner: _ownerTypeConverter.decode(row['owner'] as String),
            htmlUrl: row['htmlUrl'] as String?,
            description: row['description'] as String?,
            fork: row['fork'] == null ? null : (row['fork'] as int) != 0,
            url: row['url'] as String?,
            forksUrl: row['forksUrl'] as String?,
            keysUrl: row['keysUrl'] as String?,
            collaboratorsUrl: row['collaboratorsUrl'] as String?,
            teamsUrl: row['teamsUrl'] as String?,
            hooksUrl: row['hooksUrl'] as String?,
            issueEventsUrl: row['issueEventsUrl'] as String?,
            eventsUrl: row['eventsUrl'] as String?,
            assigneesUrl: row['assigneesUrl'] as String?,
            branchesUrl: row['branchesUrl'] as String?,
            tagsUrl: row['tagsUrl'] as String?,
            blobsUrl: row['blobsUrl'] as String?,
            gitTagsUrl: row['gitTagsUrl'] as String?,
            gitRefsUrl: row['gitRefsUrl'] as String?,
            treesUrl: row['treesUrl'] as String?,
            statusesUrl: row['statusesUrl'] as String?,
            languagesUrl: row['languagesUrl'] as String?,
            stargazersUrl: row['stargazersUrl'] as String?,
            contributorsUrl: row['contributorsUrl'] as String?,
            subscribersUrl: row['subscribersUrl'] as String?,
            subscriptionUrl: row['subscriptionUrl'] as String?,
            commitsUrl: row['commitsUrl'] as String?,
            gitCommitsUrl: row['gitCommitsUrl'] as String?,
            commentsUrl: row['commentsUrl'] as String?,
            issueCommentUrl: row['issueCommentUrl'] as String?,
            contentsUrl: row['contentsUrl'] as String?,
            compareUrl: row['compareUrl'] as String?,
            mergesUrl: row['mergesUrl'] as String?,
            archiveUrl: row['archiveUrl'] as String?,
            downloadsUrl: row['downloadsUrl'] as String?,
            issuesUrl: row['issuesUrl'] as String?,
            pullsUrl: row['pullsUrl'] as String?,
            milestonesUrl: row['milestonesUrl'] as String?,
            notificationsUrl: row['notificationsUrl'] as String?,
            labelsUrl: row['labelsUrl'] as String?,
            releasesUrl: row['releasesUrl'] as String?,
            deploymentsUrl: row['deploymentsUrl'] as String?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?,
            pushedAt: row['pushedAt'] as String?,
            gitUrl: row['gitUrl'] as String?,
            sshUrl: row['sshUrl'] as String?,
            cloneUrl: row['cloneUrl'] as String?,
            svnUrl: row['svnUrl'] as String?,
            homepage: row['homepage'] as String?,
            size: row['size'] as int?,
            stargazersCount: row['stargazersCount'] as int?,
            watchersCount: row['watchersCount'] as int?,
            language: row['language'] as String?,
            hasIssues: row['hasIssues'] == null
                ? null
                : (row['hasIssues'] as int) != 0,
            hasProjects: row['hasProjects'] == null
                ? null
                : (row['hasProjects'] as int) != 0,
            hasDownloads: row['hasDownloads'] == null
                ? null
                : (row['hasDownloads'] as int) != 0,
            hasWiki:
                row['hasWiki'] == null ? null : (row['hasWiki'] as int) != 0,
            hasPages:
                row['hasPages'] == null ? null : (row['hasPages'] as int) != 0,
            hasDiscussions: row['hasDiscussions'] == null
                ? null
                : (row['hasDiscussions'] as int) != 0,
            forksCount: row['forksCount'] as int?,
            archived:
                row['archived'] == null ? null : (row['archived'] as int) != 0,
            disabled:
                row['disabled'] == null ? null : (row['disabled'] as int) != 0,
            openIssuesCount: row['openIssuesCount'] as int?,
            license: _licenseTypeConverter.decode(row['license'] as String),
            allowForking: row['allowForking'] == null
                ? null
                : (row['allowForking'] as int) != 0,
            isTemplate: row['isTemplate'] == null
                ? null
                : (row['isTemplate'] as int) != 0,
            webCommitSignoffRequired: row['webCommitSignoffRequired'] == null
                ? null
                : (row['webCommitSignoffRequired'] as int) != 0,
            topics: _topicsTypeConverter.decode(row['topics'] as String),
            visibility: row['visibility'] as String?,
            forks: row['forks'] as int?,
            openIssues: row['openIssues'] as int?,
            watchers: row['watchers'] as int?,
            defaultBranch: row['defaultBranch'] as String?,
            score: row['score'] as double?));
  }

  @override
  Future<void> insertItem(GitRepoEntity item) async {
    await _gitRepoEntityInsertionAdapter.insert(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteItem(GitRepoEntity item) async {
    await _gitRepoEntityDeletionAdapter.delete(item);
  }
}

class _$LocalResponseDao extends LocalResponseDao {
  _$LocalResponseDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _localResponseEntityInsertionAdapter = InsertionAdapter(
            database,
            'response_table',
            (LocalResponseEntity item) => <String, Object?>{
                  'page': item.page,
                  'response': item.response
                }),
        _localResponseEntityDeletionAdapter = DeletionAdapter(
            database,
            'response_table',
            ['page'],
            (LocalResponseEntity item) => <String, Object?>{
                  'page': item.page,
                  'response': item.response
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LocalResponseEntity>
      _localResponseEntityInsertionAdapter;

  final DeletionAdapter<LocalResponseEntity>
      _localResponseEntityDeletionAdapter;

  @override
  Future<LocalResponseEntity?> findResponseByPage(int page) async {
    return _queryAdapter.query('SELECT * FROM response_table WHERE page = ?1',
        mapper: (Map<String, Object?> row) =>
            LocalResponseEntity(row['page'] as int, row['response'] as String),
        arguments: [page]);
  }

  @override
  Future<void> insertResponse(LocalResponseEntity responseEntity) async {
    await _localResponseEntityInsertionAdapter.insert(
        responseEntity, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteResponse(LocalResponseEntity responseEntity) async {
    await _localResponseEntityDeletionAdapter.delete(responseEntity);
  }
}

// ignore_for_file: unused_element
final _ownerTypeConverter = OwnerTypeConverter();
final _licenseTypeConverter = LicenseTypeConverter();
final _topicsTypeConverter = TopicsTypeConverter();
