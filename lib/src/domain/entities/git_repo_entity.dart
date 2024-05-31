import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:top_flutter_repo/src/domain/entities/licens_entity.dart';
import 'package:top_flutter_repo/src/domain/entities/owner_entity.dart';
import 'package:top_flutter_repo/src/utils/constants/const.dart';

@Entity(tableName: itemsTableName)
class GitRepoEntity extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final bool? private;
  final OwnerEntity? owner;
  final String? htmlUrl;
  final String? description;
  final bool? fork;
  final String? url;
  final String? forksUrl;
  final String? keysUrl;
  final String? collaboratorsUrl;
  final String? teamsUrl;
  final String? hooksUrl;
  final String? issueEventsUrl;
  final String? eventsUrl;
  final String? assigneesUrl;
  final String? branchesUrl;
  final String? tagsUrl;
  final String? blobsUrl;
  final String? gitTagsUrl;
  final String? gitRefsUrl;
  final String? treesUrl;
  final String? statusesUrl;
  final String? languagesUrl;
  final String? stargazersUrl;
  final String? contributorsUrl;
  final String? subscribersUrl;
  final String? subscriptionUrl;
  final String? commitsUrl;
  final String? gitCommitsUrl;
  final String? commentsUrl;
  final String? issueCommentUrl;
  final String? contentsUrl;
  final String? compareUrl;
  final String? mergesUrl;
  final String? archiveUrl;
  final String? downloadsUrl;
  final String? issuesUrl;
  final String? pullsUrl;
  final String? milestonesUrl;
  final String? notificationsUrl;
  final String? labelsUrl;
  final String? releasesUrl;
  final String? deploymentsUrl;
  final String? createdAt;
  final String? updatedAt;
  final String? pushedAt;
  final String? gitUrl;
  final String? sshUrl;
  final String? cloneUrl;
  final String? svnUrl;
  final String? homepage;
  final int? size;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final bool? hasIssues;
  final bool? hasProjects;
  final bool? hasDownloads;
  final bool? hasWiki;
  final bool? hasPages;
  final bool? hasDiscussions;
  final int? forksCount;
  final bool? archived;
  final bool? disabled;
  final int? openIssuesCount;
  final LicenseEntity? license;
  final bool? allowForking;
  final bool? isTemplate;
  final bool? webCommitSignoffRequired;
  final List<String>? topics;
  final String? visibility;
  final int? forks;
  final int? openIssues;
  final int? watchers;
  final String? defaultBranch;
  final double? score;

  const GitRepoEntity({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.hasDiscussions,
    this.forksCount,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
  });

  factory GitRepoEntity.fromMap(Map<String, dynamic> map) {
    return GitRepoEntity(
        id: map['id'],
        nodeId: map['node_id'],
        name: map['name'],
        fullName: map['full_name'],
        private: map['private'],
        owner: map['owner'] != null ? OwnerEntity.fromMap(map['owner']) : null,
    htmlUrl: map['html_url'],
    description: map['description'],
    fork: map['fork'],
    url: map['url'],
    forksUrl: map['forks_url'],
    keysUrl: map['keys_url'],
    collaboratorsUrl: map['collaborators_url'],
    teamsUrl: map['teams_url'],
    hooksUrl: map['hooks_url'],
    issueEventsUrl: map['issue_events_url'],
    eventsUrl: map['events_url'],
    assigneesUrl: map['assignees_url'],
    branchesUrl: map['branches_url'],
    tagsUrl: map['tags_url'],
    blobsUrl: map['blobs_url'],
    gitTagsUrl: map['git_tags_url'],
    gitRefsUrl: map['git_refs_url'],
    treesUrl: map['trees_url'],
    statusesUrl: map['statuses_url'],
    languagesUrl: map['languages_url'],
    stargazersUrl: map['stargazers_url'],
    contributorsUrl: map['contributors_url'],
    subscribersUrl: map['subscribers_url'],
    subscriptionUrl: map['subscription_url'],
    commitsUrl: map['commits_url'],
    gitCommitsUrl: map['git_commits_url'],
    commentsUrl: map['comments_url'],
    issueCommentUrl: map['issue_comment_url'],
    contentsUrl: map['contents_url'],
    compareUrl: map['compare_url'],
    mergesUrl: map['merges_url'],
    archiveUrl: map['archive_url'],
    downloadsUrl: map['downloads_url'],
    issuesUrl: map['issues_url'],
    pullsUrl: map['pulls_url'],
    milestonesUrl: map['milestones_url'],
    notificationsUrl: map['notifications_url'],
    labelsUrl: map['labels_url'],
    releasesUrl: map['releases_url'],
    deploymentsUrl: map['deployments_url'],
    createdAt: map['created_at'],
    updatedAt: map['updated_at'],
    pushedAt: map['pushed_at'],
    gitUrl: map['git_url'],
    sshUrl: map['ssh_url'],
    cloneUrl: map['clone_url'],
    svnUrl: map['      svn_url'],
      homepage: map['homepage'],
      size: map['size'],
      stargazersCount: map['stargazers_count'],
      watchersCount: map['watchers_count'],
      language: map['language'],
      hasIssues: map['has_issues'],
      hasProjects: map['has_projects'],
      hasDownloads: map['has_downloads'],
      hasWiki: map['has_wiki'],
      hasPages: map['has_pages'],
      hasDiscussions: map['has_discussions'],
      forksCount: map['forks_count'],
      archived: map['archived'],
      disabled: map['disabled'],
      openIssuesCount: map['open_issues_count'],
      license: map['license'] != null ? LicenseEntity.fromMap(map['license']) : null,
      allowForking: map['allow_forking'],
      isTemplate: map['is_template'],
      webCommitSignoffRequired: map['web_commit_signoff_required'],
      topics: List<String>.from(map['topics']),
      visibility: map['visibility'],
      forks: map['forks'],
      openIssues: map['open_issues'],
      watchers: map['watchers'],
      defaultBranch: map['default_branch'],
      score: map['score'],
    );
  }

  // Method to convert Item object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nodeId': nodeId,
      'name': name,
      'fullName': fullName,
      'private': private,
      'owner': owner != null ? owner!.toMap() : null,
      'htmlUrl': htmlUrl,
      'description': description,
      'fork': fork,
      'url': url,
      'forksUrl': forksUrl,
      'keysUrl': keysUrl,
      'collaboratorsUrl': collaboratorsUrl,
      'teamsUrl': teamsUrl,
      'hooksUrl': hooksUrl,
      'issueEventsUrl': issueEventsUrl,
      'eventsUrl': eventsUrl,
      'assigneesUrl': assigneesUrl,
      'branchesUrl': branchesUrl,
      'tagsUrl': tagsUrl,
      'blobsUrl': blobsUrl,
      'gitTagsUrl': gitTagsUrl,
      'gitRefsUrl': gitRefsUrl,
      'treesUrl': treesUrl,
      'statusesUrl': statusesUrl,
      'languagesUrl': languagesUrl,
      'stargazersUrl': stargazersUrl,
      'contributorsUrl': contributorsUrl,
      'subscribersUrl': subscribersUrl,
      'subscriptionUrl': subscriptionUrl,
      'commitsUrl': commitsUrl,
      'gitCommitsUrl': gitCommitsUrl,
      'commentsUrl': commentsUrl,
      'issueCommentUrl': issueCommentUrl,
      'contentsUrl': contentsUrl,
      'compareUrl': compareUrl,
      'mergesUrl': mergesUrl,
      'archiveUrl': archiveUrl,
      'downloadsUrl': downloadsUrl,
      'issuesUrl': issuesUrl,
      'pullsUrl': pullsUrl,
      'milestonesUrl': milestonesUrl,
      'notificationsUrl': notificationsUrl,
      'labelsUrl': labelsUrl,
      'releasesUrl': releasesUrl,
      'deploymentsUrl': deploymentsUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'pushedAt': pushedAt,
      'gitUrl': gitUrl,
      'sshUrl': sshUrl,
      'cloneUrl': cloneUrl,
      'svnUrl': svnUrl,
      'homepage': homepage,
      'size': size,
      'stargazersCount': stargazersCount,
      'watchersCount': watchersCount,
      'language': language,
      'hasIssues': hasIssues,
      'hasProjects': hasProjects,
      'hasDownloads': hasDownloads,
      'hasWiki': hasWiki,
      'hasPages': hasPages,
      'hasDiscussions': hasDiscussions,
      'forksCount': forksCount,
      'archived': archived,
      'disabled': disabled,
      'openIssuesCount': openIssuesCount,
      'license': license != null ? license!.toMap() : null,
      'allowForking': allowForking,
      'isTemplate': isTemplate,
      'webCommitSignoffRequired': webCommitSignoffRequired,
      'topics': topics,
      'visibility': visibility,
      'forks': forks,
      'openIssues': openIssues,
      'watchers': watchers,
      'defaultBranch': defaultBranch,
      'score': score,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      nodeId,
      name,
      fullName,
      private,
      owner,
      htmlUrl,
      description,
      fork,
      url,
      forksUrl,
      keysUrl,
      collaboratorsUrl,
      teamsUrl,
      hooksUrl,
      issueEventsUrl,
      eventsUrl,
      assigneesUrl,
      branchesUrl,
      tagsUrl,
      blobsUrl,
      gitTagsUrl,
      gitRefsUrl,
      treesUrl,
      statusesUrl,
      languagesUrl,
      stargazersUrl,
      contributorsUrl,
      subscribersUrl,
      subscriptionUrl,
      commitsUrl,
      gitCommitsUrl,
      commentsUrl,
      issueCommentUrl,
      contentsUrl,
      compareUrl,
      mergesUrl,
      archiveUrl,
      downloadsUrl,
      issuesUrl,
      pullsUrl,
      milestonesUrl,
      notificationsUrl,
      labelsUrl,
      releasesUrl,
      deploymentsUrl,
      createdAt,
      updatedAt,
      pushedAt,
      gitUrl,
      sshUrl,
      cloneUrl,
      svnUrl,
      homepage,
      size,
      stargazersCount,
      watchersCount,
      language,
      hasIssues,
      hasProjects,
      hasDownloads,
      hasWiki,
      hasPages,
      hasDiscussions,
      forksCount,
      archived,
      disabled,
      openIssuesCount,
      license,
      allowForking,
      isTemplate,
      webCommitSignoffRequired,
      topics,
      visibility,
      forks,
      openIssues,
      watchers,
      defaultBranch,
      score,
    ];
  }
}



