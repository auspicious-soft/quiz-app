import 'package:comptia/features/data/source/ds_local_repo.dart';

class LocalDataSourceImpl implements DataSourceRepoForLocal {
  @override
  bool testConnect() {
    return true;
  }
}
