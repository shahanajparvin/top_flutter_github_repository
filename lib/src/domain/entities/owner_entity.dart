import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;

  const OwnerEntity({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  factory OwnerEntity.fromMap(Map<String, dynamic> map) {
    return OwnerEntity(
      login: map['login'],
      id: map['id'],
      nodeId: map['node_id'],
      avatarUrl: map['avatar_url'],
      gravatarId: map['gravatar_id'],
      url: map['url'],
      htmlUrl: map['html_url'],
      followersUrl: map['followers_url'],
      followingUrl: map['following_url'],
      gistsUrl: map['gists_url'],
      starredUrl: map['starred_url'],
      subscriptionsUrl: map['subscriptions_url'],
      organizationsUrl: map['organizations_url'],
      reposUrl: map['repos_url'],
      eventsUrl: map['events_url'],
      receivedEventsUrl: map['received_events_url'],
      type: map['type'],
      siteAdmin: map['site_admin'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'id': id,
      'node_id': nodeId,
      'avatar_url': avatarUrl,
      'gravatar_id': gravatarId,
      'url': url,
      'html_url': htmlUrl,
      'followers_url': followersUrl,
      'following_url': followingUrl,
      'gists_url': gistsUrl,
      'starred_url': starredUrl,
      'subscriptions_url': subscriptionsUrl,
      'organizations_url': organizationsUrl,
      'repos_url': reposUrl,
      'events_url': eventsUrl,
      'received_events_url': receivedEventsUrl,
      'type': type,
      'site_admin': siteAdmin,
    };
  }

  @override
  List<Object?> get props {
    return [
      login,
      id,
      nodeId,
      avatarUrl,
      gravatarId,
      url,
      htmlUrl,
      followersUrl,
      followingUrl,
      gistsUrl,
      starredUrl,
      subscriptionsUrl,
      organizationsUrl,
      reposUrl,
      eventsUrl,
      receivedEventsUrl,
      type,
      siteAdmin,
    ];
  }
}