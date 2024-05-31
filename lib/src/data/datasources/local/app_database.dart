import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:top_flutter_repo/src/data/datasources/local/converters/licens_type_converter.dart';
import 'package:top_flutter_repo/src/data/datasources/local/converters/owner_type_converter.dart';
import 'package:top_flutter_repo/src/data/datasources/local/converters/topics_type_converter.dart';
import 'package:top_flutter_repo/src/data/datasources/local/dao/local_response_dao.dart';
import 'package:top_flutter_repo/src/data/datasources/local/dao/save_item_dao.dart';
import 'package:top_flutter_repo/src/domain/entities/git_repo_entity.dart';
import 'package:top_flutter_repo/src/domain/entities/local_response_entity.dart';




part 'app_database.g.dart';

@TypeConverters([OwnerTypeConverter,LicenseTypeConverter, TopicsTypeConverter])
@Database(version: 1, entities: [GitRepoEntity,LocalResponseEntity])
abstract class AppDatabase extends FloorDatabase {
  SaveItemDao get itemDao;
  LocalResponseDao get responseDao;
}


