import 'package:comptia/features/domain/repo/local_domain_repo.dart';

class UCTestCon {
  final LocalDomainRepo repo;

  UCTestCon({required this.repo});
  bool btnTestConnection() {
    return repo.testConnect();
  }
}
