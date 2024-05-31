import 'package:floor/floor.dart';
import 'package:top_flutter_repo/src/utils/constants/const.dart';

@Entity(tableName: responseTableName)
class LocalResponseEntity {
  @primaryKey
  final int page;

  final String response;

  LocalResponseEntity(this.page, this.response);
}
