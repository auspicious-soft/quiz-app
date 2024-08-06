//To know more please visit to information.txt
import 'package:comptia/features/data/source/ds_local_repo.dart';
import 'package:comptia/features/domain/repo/local_domain_repo.dart';
import 'package:comptia/features/domain/usecases/uc_quiz_panel.dart';
import 'package:comptia/features/domain/usecases/uc_test_con.dart';
import 'package:comptia/features/presentation/cubits/cubit_test_con/cubit_test_con.dart';
import 'package:comptia/features/presentation/cubits/question_prog/cubit_question_prog.dart';
import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:get_it/get_it.dart';

import '../../../features/data/repo/impl_local_domain_repo.dart';
import '../../../features/data/repo/local_impl.dart';
import '../../../features/presentation/cubits/quiz_timer/cubit_quiz_timer.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //::::::::::::::::::::CUBIT REGISTRATION:::::::::::::::::::::::::::::::

  sl.registerFactory<CubitTest>(() => CubitTest(uc: sl.call()));
 sl.registerFactory<CubitQuestionProgress>(() => CubitQuestionProgress(uc: sl.call()));
 sl.registerFactory<CubitQuizTimer>(() => CubitQuizTimer());

/*::::::::::::::::::::::::USECASE REGISTRATION:::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*/
  // sl.registerLazySingleton<UseCaseCountryData>(
  //         () => UseCaseCountryData(localRepository: sl.call(), remoteRepository: sl.call()));
  //

  sl.registerLazySingleton<UCTestCon>(() => UCTestCon(repo: sl.call()));
sl.registerLazySingleton<UCQuizPanel>(() => UCQuizPanel(repo: sl.call()));

  //Remote  and local datasource
  sl.registerLazySingleton<DataSourceRepoForLocal>(() => LocalDataSourceImpl());
  sl.registerLazySingleton<LocalDomainRepo>(() => DomainLocalRepoImpl(lds: sl.call()));
  
  // sl.registerLazySingleton<RemoteServerDataSource>(
  //     () => RemoteServerDataSourceImpl(box: sl.call(), dio: sl.call()));
  // //External

  // File path to a file in the current directory
  // await Hive.initFlutter();
  // // Open the peopleBox
  // final box = await Hive.openBox('offsetBox');

  // final http.Client httpClient = http.Client();
  // sl.registerLazySingleton<http.Client>(() => httpClient);

  final dio = Dio()
    ..options.baseUrl = "http://www.google.com"
    ..interceptors.add(LogInterceptor())
    ..httpClientAdapter = Http2Adapter(ConnectionManager(
      idleTimeout: const Duration(seconds: 15),
      onClientCreate: (_, config) => config.onBadCertificate = (_) => true,
    ));

  sl.registerLazySingleton(() => dio);
  //final localDB = await SharedPreferences.getInstance();

  //sl.registerLazySingleton(() => localDB);
  // sl.registerLazySingleton(() => box);
}
