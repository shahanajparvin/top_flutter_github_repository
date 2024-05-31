import 'dart:convert';
import 'package:floor/floor.dart';
import 'package:top_flutter_repo/src/domain/entities/licens_entity.dart';



class LicenseTypeConverter extends TypeConverter<LicenseEntity?, String> {
  @override
  LicenseEntity? decode(String databaseValue) {
    if(databaseValue.isEmpty)
      return null;
    LicenseEntity value = LicenseEntity.fromMap(json.decode(databaseValue));
    return value;
  }

  @override
  String encode(LicenseEntity? value) {
    if(value!=null) {
      return json.encode(value.toMap());
    } else {
      return '';
    }
  }
}
