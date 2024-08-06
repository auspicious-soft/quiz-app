import 'package:comptia/features/presentation/pages/dashboard/category_panel/pg_category_list.dart';
import 'package:comptia/features/presentation/pages/dashboard/quiz_panel/pg_quiz_panel.dart';
import 'package:comptia/features/presentation/pages/navigations/pg_const.dart';
import 'package:comptia/features/presentation/pages/pg_result/pg_question_accordion.dart';
import 'package:comptia/features/presentation/pages/pg_subscription.dart';
import 'package:comptia/features/presentation/pages/report/pg_report.dart';
import 'package:flutter/material.dart';

import '../dashboard/pg_dashboard.dart';
import '../dashboard/tab_setting/pg_contactus.dart';
import '../dashboard/tab_setting/pg_rateus.dart';
import '../dashboard/tab_setting/pg_term_and_policy.dart';
import '../pg_result/pg_result.dart';

//   Navigator.pushNamedAndRemoveUntil(
// context,
// PageRouteBuilder(
// pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
// transitionsBuilder: (context, animation, secondaryAnimation, child) {
// var begin = Offset(1.0, 0.0);
// var end = Offset.zero;
// var curve = Curves.ease;
// var tween = Tween(begin: begin, end: end)
// .chain(CurveTween(curve: curve));
// return SlideTransition(
// position: animation.drive(tween),
// child: child,
// );
//       }));
// var curve = Curves.ease;
// var curveTween = CurveTween(curve: curve);
Route createRoute(destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destination,
    // transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //   return child;
    // },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      //final tween = Tween(begin: begin, end: end);

      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

class PageRoutes {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConst.splash:
        return materialBuilder(
          widget: const PageSubscription(),
          routeSettings: settings,
        );
      // return materialBuilder(
      //   widget:   PageLogin(isLoginFromGuesMode: false,),
      //   routeSettings: settings,
      // );

case PageConst.quizPanel:
        return materialBuilder(
          widget: const PgQuizPanel(),
          routeSettings: settings,
        );
case PageConst.pgQuesAccordion:
 return materialBuilder(
          widget: const PgQuestionAccordion(),
          routeSettings: settings,
        );
        case PageConst.contactUs:
 return materialBuilder(
          widget: const PageContactUs(),
          routeSettings: settings,
        );
        
        case PageConst.rateus:
 return materialBuilder(
          widget: const PageRateUs(),
          routeSettings: settings,
        );
        
        case PageConst.categoryList:
 return materialBuilder(
          widget: const PageCategoryList(),
          routeSettings: settings,
        );
case PageConst.pgReport:
        return materialBuilder(
          widget: const PgReport(),
          routeSettings: settings,
        );
case PageConst.termsAndCond:
        return materialBuilder(
          widget: const PageTermAndPolicy(data: p),
          routeSettings: settings,
        );
        
        case PageConst.resultScreen:
        return materialBuilder(
          widget: const PgResult(),
          routeSettings: settings,
        );
      case PageConst.dashBoard:
        return materialBuilder(
          widget: const PgDashBoard(),
          routeSettings: settings,
        );

      default:
        return materialBuilder(
          widget: const ErrorPage(),
          routeSettings: settings,
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("error"),
      ),
      body: const Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder(
    {required RouteSettings routeSettings, required Widget widget}) {
  return MaterialPageRoute(settings: routeSettings, builder: (_) => widget);
}



const p = "Imagine each paragraph as a sandwich. Imagine each paragraph as a sandwich. The real content of the sandwich—the meat or other filling—is in the middle. It includes all the evidence you need to make the point. But it gets kind of messy to eat a sandwich without any bread. Your readers don’t know what to do with all the evidence you’ve given them. So, the top slice of bread (the first sentence of the paragraph) explains the topic (or controlling idea) of the paragraph. And, the bottom slice (the last sentence of the paragraph) tells the reader how the paragraph relates to the broader argument. In the original and revised paragraphs below, notice how a topic sentence expressing the controlling idea tells the reader the poImagine each paragraph as a sandwich. The real content of the sandwich—the meat or other filling—is in the middle. It includes all the evidence you need to make the point. But it gets kind of messy to eat a sandwich without any bread. Your readers don’t know what to do with all the evidence you’ve given them. So, the top slice of bread (the first sentence of the paragraph) explains the topic (or controlling idea) of the paragraph. And, the bottom slice (the last sentence of the paragraph) tells the reader how the paragraph relates to the broader argument. In the original and revised paragraphs below, notice how a topic sentence expressing the controlling idea tells the reader the point of all the evidence.Imagine each paragraph as a sandwich. The real content of the sandwich—the meat or other filling—is in the middle. It includes all the evidence you need to make the point. But it gets kind of messy to eat a sandwich without any bread. Your readers don’t know what to do with all the evidence you’ve given them. So, the top slice of bread (the first sentence of the paragraph) explains the topic (or controlling idea) of the paragraph. And, the bottom slice (the last sentence of the paragraph) tells the reader how the paragraph relates to the broader argument. In the original and revised paragraphs below, notice how a topic sentence expressing the controlling idea tells the reader the point of all the evidence.Imagine each paragraph as a sandwich. The real content of the sandwich—the meat or other filling—is in the middle. It includes all the evidence you need to make the point. But it gets kind of messy to eat a sandwich without any bread. Your readers don’t know what to do with all the evidence you’ve given them. So, the top slice of bread (the first sentence of the paragraph) explains the topic (or controlling idea) of the paragraph. And, the bottom slice (the last sentence of the paragraph) tells the reader how the paragraph relates to the broader argument. In the original and revised paragraphs below, notice how a topic sentence expressing the controlling idea tells the reader the point of all the evidence.Imagine each paragraph as a sandwich. The real content of the sandwich—the meat or other filling—is in the middle. It includes all the evidence you need to make the point. But it gets kind of messy to eat a sandwich without any bread. Your readers don’t know what to do with all the evidence you’ve given them. So, the top slice of bread (the first sentence of the paragraph) explains the topic (or controlling idea) of the paragraph. And, the bottom slice (the last sentence of the paragraph) tells the reader how the paragraph relates to the broader argument. In the original and revised paragraphs below, notice how a topic sentence expressing the controlling idea tells the reader the point of all the evidence.Imagine each paragraph as a sandwich. The real content of the sandwich—the meat or other filling—is in the middle. It includes all the evidence you need to make the point. But it gets kind of messy to eat a sandwich without any bread. Your readers don’t know what to do with all the evidence you’ve given them. So, the top slice of bread (the first sentence of the paragraph) explains the topic (or controlling idea) of the paragraph. And, the bottom slice (the last sentence of the paragraph) tells the reader how the paragraph relates to the broader argument. In the original and revised paragraphs below, notice how a topic sentence expressing the controlling idea tells the reader the point of all the evidence.Imagine each paragraph as a sandwich. The real content of the sandwich—the meat or other filling—is in the middle. It includes all the evidence you need to make the point. But it gets kind of messy to eat a sandwich without any bread. Your readers don’t know what to do with all the evidence you’ve given them. So, the top slice of bread (the first sentence of the paragraph) explains the topic (or controlling idea) of the paragraph. And, the bottom slice (the last sentence of the paragraph) tells the reader how the paragraph relates to the broader argument. In the original and revised paragraphs below, notice how a topic sentence expressing the controlling idea tells the reader the point of all the evidence.int of all the evidence.The real content of the sandwich—the meat or other filling—is in the middle. It includes all the evidence you need to make the point. But it gets kind of messy to eat a sandwich without any bread. Your readers don’t know what to do with all the evidence you’ve given them. So, the top slice of bread (the first sentence of the paragraph) explains the topic (or controlling idea) of the paragraph. And, the bottom slice (the last sentence of the paragraph) tells the reader how the paragraph relates to the broader argument. In the original and revised paragraphs below, notice how a topic sentence expressing the controlling idea tells the reader the point of all the evidence.";