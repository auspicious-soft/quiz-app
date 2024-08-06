import 'package:comptia/features/data/source/ds_remote_repo.dart';
import 'package:comptia/features/domain/repo/remote_domain_repo.dart';

class DomainRemoteRepoImpl implements RemoteDomainRepo {
  final DataSourceRepoForRemote rds;

  DomainRemoteRepoImpl({required this.rds});
  @override
  void remoteTestConnect() {
    rds.remoteTestConnect();
  }
}
