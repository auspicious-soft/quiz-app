import 'package:comptia/features/domain/repo/local_domain_repo.dart';

class UCQuizPanel {
  final LocalDomainRepo repo;

  UCQuizPanel({required this.repo});
  bool btnTestConnection() {
    return repo.testConnect();
  }
}
