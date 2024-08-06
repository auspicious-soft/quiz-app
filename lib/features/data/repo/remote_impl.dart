import 'package:comptia/features/data/source/ds_remote_repo.dart';

class RemoteDataSourceImpl implements DataSourceRepoForRemote {
  @override
  void remoteTestConnect() {
    print("Connection success for remote");
  }
}
