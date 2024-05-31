import 'package:top_flutter_repo/src/utils/constants/nums.dart';
import 'package:top_flutter_repo/src/utils/constants/strings.dart';

class GitReposRequest {
  final String sort;
  final String query;
  final int page;
  final String order;
  final int pageSize;

  GitReposRequest({
    this.query = defaultQuery,
    this.sort = defaultSort,
    this.order = defaultOrder,
    this.page = 1,
    this.pageSize = defaultPageSize,
  });
}

