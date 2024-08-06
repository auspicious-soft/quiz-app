import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/core/app_settings/constants/set_strings.dart';
import 'package:comptia/features/presentation/pages/pg_result/tab_all/tab_all.dart';
import 'package:comptia/features/presentation/pages/pg_result/tab_correct/tab_correct.dart';
import 'package:comptia/features/presentation/pages/pg_result/tab_incorrect/tab_incorrect.dart';
import 'package:comptia/features/presentation/widgets/cards/card_row.dart';
import 'package:comptia/features/presentation/widgets/custom_appbar.dart';
import 'package:comptia/features/presentation/widgets/custom_tab_header.dart';
import 'package:comptia/features/presentation/widgets/dialogs/dialog_quick_result.dart';
import 'package:comptia/features/presentation/widgets/text/text_title_medium.dart';
import 'package:comptia/features/presentation/widgets/widget_global_margin.dart';
import 'package:flutter/material.dart';


class PgResult extends StatefulWidget {
  const PgResult({super.key});
  
  @override
  State<StatefulWidget> createState() {
  return _StatePgResult();
  }
}
class _StatePgResult extends State<PgResult> with TickerProviderStateMixin {
  late TabController tbController;
  int tab = 0;
  @override
  void initState() { 
    super.initState();
    tbController = TabController(length: 3, vsync: this);
    tbController.addListener(() { 
      setState(() {
        tab = tbController.index;
      });
      tbController.animateTo(tab);
    });
  }
  @override
  void dispose() {
   tbController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: customAppBar(title: "Result"),
    body:  WidgetGlobalMargin(
      //padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            padVertical(20),
             const Center(child: WidgetCircularProgress(resultPercent: 70)),
          padVertical(30),
          const TextTitleMedium(title: SetString.Community_Averages),
        padVertical(20),
        const CardRow(title: "Your Sore"),
         padVertical(2),
        const CardRow(title: "Your Time"),
        padVertical(30),
            TextTitleMedium(title: SetString.Result),
        padVertical(20),
        const CardRow(title: "Your Sore"),
         padVertical(2),
        const CardRow(title: "Your Time"),
         padVertical(30),
            TextTitleMedium(title: SetString.Questions),
        padVertical(10),
          
       Container(
        decoration: const BoxDecoration(
           boxShadow: [BoxShadow(offset: Offset(-3, 8), blurRadius: 0.5, color: Colors.black12, spreadRadius: -6)],
          
        ),
         child: CustomTabHeader(titles: const ["All","Correct","Incorrect"], tabController: tbController,
          selectedTab: tab),
       ),
        SizedBox(
          height: 400,
          child: TabBarView(controller: tbController, children:   const [
           TabAll(),
           TabCorrect(),
            TabInCorrect()
             
          ]),
        ),
       
         padVertical(10), 
          ],
        ),
      ),
    ));
  }
  
}

