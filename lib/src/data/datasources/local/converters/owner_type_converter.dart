import 'dart:convert';
import 'package:floor/floor.dart';
import 'package:top_flutter_repo/src/domain/entities/owner_entity.dart';




class OwnerTypeConverter extends TypeConverter<OwnerEntity?, String> {

  @override
  OwnerEntity? decode(String databaseValue) {
    OwnerEntity ownerValue = OwnerEntity.fromMap(json.decode(databaseValue));
    return ownerValue;
  }

  @override
  String encode(OwnerEntity? value) {
    return json.encode(value!.toMap());
  }
}

