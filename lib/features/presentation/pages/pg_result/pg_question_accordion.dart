import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/features/presentation/widgets/custom_appbar.dart';
import 'package:comptia/features/presentation/widgets/widget_global_margin.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_tab_header.dart';
import 'tab_all/tab_all.dart';
import 'tab_correct/tab_correct.dart';
import 'tab_incorrect/tab_incorrect.dart';

class PgQuestionAccordion  extends StatefulWidget{
  const PgQuestionAccordion({super.key});
  
  @override
  State<StatefulWidget> createState() {
  return _StatePgQuestionAcc();
  }
}
class _StatePgQuestionAcc extends State<PgQuestionAccordion> with TickerProviderStateMixin {
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
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: customAppBar(title: "Question Accordion"),
    body:  WidgetGlobalMargin(child: Column(children: [
      Container(
        decoration: const BoxDecoration(
           boxShadow: [BoxShadow(offset: Offset(-3, 8), blurRadius: 0.5, color: Colors.black12, spreadRadius: -6)],
          
        ),
         child: CustomTabHeader(titles: const ["All","Correct","Incorrect"], tabController: tbController,
          selectedTab: tab),
       ),
        Expanded(
          //height: 400,
          child: TabBarView(controller: tbController, children:   const [
           TabAll(),
           TabCorrect(),
            TabInCorrect()
             
          ]),
        ),
        padVertical(20)
       
    ],)),);
  }
  
}