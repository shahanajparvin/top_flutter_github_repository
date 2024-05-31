
import 'package:top_flutter_repo/src/domain/entities/local_response_entity.dart';
import 'package:top_flutter_repo/src/utils/constants/const.dart';
import 'package:floor/floor.dart';

@dao
abstract class LocalResponseDao {

  @Query('SELECT * FROM $responseTableName WHERE page = :page')
  Future<LocalResponseEntity?> findResponseByPage(int page);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertResponse(LocalResponseEntity responseEntity);

  @delete
  Future<void> deleteResponse(LocalResponseEntity responseEntity);
}