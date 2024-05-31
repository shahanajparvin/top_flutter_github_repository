import 'package:equatable/equatable.dart';

class LicenseEntity extends Equatable {
  final String? key;
  final String? name;
  final String? spdxId;
  final String? url;
  final String? nodeId;

  const LicenseEntity({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  factory LicenseEntity.fromMap(Map<String, dynamic> map) {
    return LicenseEntity(
      key: map['key'],
      name: map['name'],
      spdxId: map['spdx_id'],
      url: map['url'],
      nodeId: map['node_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'spdx_id': spdxId,
      'url': url,
      'node_id': nodeId,
    };
  }

  @override
  List<Object?> get props {
    return [
      key,
      name,
      spdxId,
      url,
      nodeId,
    ];
  }
}