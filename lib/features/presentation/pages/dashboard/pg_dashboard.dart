import 'package:comptia/core/app_settings/constants/app_assets.dart';
import 'package:comptia/features/presentation/pages/dashboard/tab_home/tab_home.dart';
import 'package:comptia/features/presentation/pages/dashboard/tab_setting/tab_setting.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_settings/theme/app_colors.dart';
import 'tab_stats/tab_stats.dart';

class PgDashBoard extends StatefulWidget {
  const PgDashBoard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StatePgDashBoard();
  }
}

class _StatePgDashBoard extends State<PgDashBoard> {
  int selectedTab = 0;

  List<Widget> get tabViews => [
       const TabHome(),
        const TabStats(
          
        ),
        const TabSetting()

        // BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        //   // toast(state.toString());

        //   if (state is UnAuthenticatedState) {
        //     return const PageLogin(
        //       isLoginFromGuesMode: true,
        //     );
        //   } else {
        //     return const PageSettingMenus(
        //       userEmail: "user email not set", //widget.userEmail
        //     );
        //   }
        // })

        // const OSPageIocsAndTTps(),
      ];
  final PageController pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemCount: tabViews.length,
          itemBuilder: (context, index) {
            return tabViews[index];
          }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTab,
          onTap: (int index) {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 100),
                curve: Curves.ease);

            //pageController.animateTo(offset, duration: duration, curve: curve)
            setState(() {
              selectedTab = index;
            });
          },
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          items: [
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                label: "Stats",
                icon: Image.asset(
                  AppAssets.stat,
                  color: (selectedTab == 1) ? AppColors.primary : null,
                )),
            const BottomNavigationBarItem(
                label: "Settings", icon: Icon(Icons.settings)),
          ]),
    );
  }
}
