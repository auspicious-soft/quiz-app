import 'package:comptia/core/app_settings/theme/light/light_theme.dart';
import 'package:comptia/features/presentation/cubits/cubit_test_con/cubit_test_con.dart';
import 'package:comptia/features/presentation/cubits/question_prog/cubit_question_prog.dart';
import 'package:comptia/features/presentation/cubits/quiz_timer/cubit_quiz_timer.dart';
import 'package:comptia/features/presentation/pages/navigations/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_settings/dependency/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await EasyLocalization.ensureInitialized();
  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp()
      // EasyLocalization(
      //     supportedLocales: const [Locale('en', 'US')],
      //     path:
      //         'assets/resources', // <-- change the path of the translation files
      //     fallbackLocale: const Locale('en', 'US'),
      //     child: const ScreenUtilInit(
      //       designSize: Size(375, 812),
      //       minTextAdapt: true,
      //       splitScreenMode: true,
      //       child: MyApp()
      //       )
      //       ),
      );
  //preview
//   const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//       .then((_) => runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => EasyLocalization(
//         supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AR')],
//         path: 'assets/resources',
//         saveLocale: true,
//         child: const MyApp(),
//       ), // Wrap your app
//     ),
//  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//final textTheme = Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: const Size(380, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CubitTest>(
            create: (_) => di.sl<CubitTest>()..appStarted(),
          ),
          BlocProvider<CubitQuestionProgress>(
            create: (_) => di.sl<CubitQuestionProgress>(),
          ),
          BlocProvider<CubitQuizTimer>(
            create: (_) => di.sl<CubitQuizTimer>(),
          ),
        ],
        child: MaterialApp(
          title: 'Quiz App',
          //  localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: myLightTheme,
          //  (ThemeMode.system == ThemeMode.dark)
          //     ? AppThemesChooser.darkTheme(context)
          //     : AppThemesChooser.lightTheme(context),

          initialRoute: '/',
          onGenerateRoute: PageRoutes.route,
        ),
      ),
    );
  }

  // void getSilentCountryList(BuildContext context) {
  //   BlocProvider.of<CredentialCubit>(context).setCountryData();
  // }
}
