import 'package:comptia/features/data/source/ds_local_repo.dart';
import 'package:comptia/features/domain/repo/local_domain_repo.dart';

class DomainLocalRepoImpl implements LocalDomainRepo {
  final DataSourceRepoForLocal lds;

  DomainLocalRepoImpl({required this.lds});
  @override
  bool testConnect() {
    return lds.testConnect();
  }
}
