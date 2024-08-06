import 'package:comptia/core/app_settings/constants/app_assets.dart';
import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/core/app_settings/constants/set_strings.dart';
import 'package:comptia/core/app_settings/theme/app_colors.dart';
import 'package:comptia/features/presentation/pages/navigations/pg_const.dart';
import 'package:comptia/features/presentation/widgets/decor_container.dart';
import 'package:comptia/features/presentation/widgets/label.dart';
import 'package:comptia/features/presentation/widgets/widget_global_margin.dart';
import 'package:comptia/features/presentation/widgets/widget_sub_title.dart';
import 'package:flutter/material.dart';

import '../../../widgets/cards/card_row.dart';
import '../../../widgets/widget_title.dart';
import '../../navigations/nav_cntrl.dart';

class TabSetting extends StatelessWidget {
  const TabSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WidgetGlobalMargin(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WidgetTitle(
                txt: "Settings",
              ),
              padVertical(30),
              cardLifeTimeFree(),
              padVertical(50),
              const WidgetSubTitle(
                txt: "Current App",
              ),
              padVertical(20),
              quizApp(),
              padVertical(5),
              clearHistory(),
              padVertical(30),
              const WidgetSubTitle(
                txt: "Current App",
              ),
              padVertical(15),
              InkWell(
                onTap: () {
                   NavigationController.navigateTo(context, PageConst.rateus);
          
                  
                },
                child: helpAndSupport(icon: AppAssets.star, title: "Rate Us")),
              padVertical(15),
              InkWell(
                onTap: () {
                  NavigationController.navigateTo(context, PageConst.contactUs);
          
                  
                },
                child: helpAndSupport(icon: AppAssets.contactUs, title: "Contact Us")),
              padVertical(15),
              InkWell(
                onTap: () {
                  NavigationController.navigateTo(context, PageConst.termsAndCond);
          
                  
                },
                child: helpAndSupport(
                    icon: AppAssets.termsAndCond, title: "Term Of Use"),
              ),
              padVertical(15),
                InkWell(
                onTap: () {
                  NavigationController.navigateTo(context, PageConst.termsAndCond);
          
                  
                },
                child: helpAndSupport(
                    icon: AppAssets.termsAndCond, title: "Privacy Policy"),
              ),
 
              padVertical(20),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox helpAndSupport({required String icon, required String title}) {
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: WidgetBaseContainer(
            corner: 10,
            color: Colors.white,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Image.asset(
                        icon,
                        height: 15,
                        width: 15,
                        fit: BoxFit.fitHeight,
                        color: AppColors.primary,
                      ),
                      padHorizontal(10),
                      Label(txt: title, type: TextTypes.f_14_450),
                    ],
                  ),
                ))));
  }

  Widget quizApp() {
    return CardRow(title: SetString.Quiz_App,);
  }

  SizedBox clearHistory() {
    return const SizedBox(
        height: 50,
        width: double.infinity,
        child: WidgetBaseContainer(
            corner: 10,
            color: Colors.white,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Label(
                    txt: "Clear History",
                    type: TextTypes.f_14_450,
                    forceColor: Color.fromRGBO(0, 178, 224, 1),
                  ),
                ))));
  }

  Widget cardLifeTimeFree() {
    return WidgetBaseContainer(
      corner: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                    txt: "Unlock",
                    type: TextTypes.f_18_500,
                    forceColor: Colors.white,
                  ),

                  Label(
                    txt: "LIFE TIME FREE",
                    type: TextTypes.f_24_700,
                    forceColor: Colors.white,
                  )

                  //Text(,style: Styles.getTxtStyle(key: TextTypes.f_24_700),)
                ],
              ),
            ),
            Image.asset(
              AppAssets.lock_holding,
              height: 54,
              width: 54,
            )
          ],
        ),
      ),
    );

    
  }
}

