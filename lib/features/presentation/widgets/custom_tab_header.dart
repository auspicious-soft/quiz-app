import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import '../../../core/app_settings/theme/app_colors.dart';
import 'label.dart'; 

class CustomTabHeader extends StatelessWidget {
  const CustomTabHeader(
      {super.key,
      required this.titles,
      required this.tabController,
      required this.selectedTab,
      this.maxThreeTabs = true});
  final TabController tabController;
  final int selectedTab;
  final List<String> titles;
  final bool maxThreeTabs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const  EdgeInsets.only(left: 0.0, right: 0, top: 10),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color:  AppColors.white ,// .shade300,
        //  border:  Border.all(color: AppColors.primary),
          borderRadius: const BorderRadius.all(
              Radius.circular(6.0) //                 <--- border radius here
              ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: TabBar(
            dividerHeight: 30,
            onTap: (value) {
              // onTapTab(value);
            },
            controller: tabController,
            tabs:
                (maxThreeTabs) ? threeTabArray(context) : twoTabArray(context),
            automaticIndicatorColorAdjustment: false,
            //  unselectedLabelColor: Colors.white,
            //indicatorSize: TabBarIndicatorSize.label,
            labelPadding: const EdgeInsets.symmetric(horizontal: 3),
            indicatorColor: Colors.transparent,
            // indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
            //indicatorWeight: 3.0,
          ),
        ),
      ),
    );
  }

  List<Widget> twoTabArray(BuildContext context) {
    return [
      myTab(0, (selectedTab == 0) ? true : false, context),
      myTab(1, (selectedTab == 1) ? true : false, context),
    ];
  }

  List<Widget> threeTabArray(BuildContext context) {
    //final tabTextThemeColor = Theme.of(context).colorScheme.primary;

    return [
      myTab(0, (selectedTab == 0) ? true : false, context),
      myTab(1, (selectedTab == 1) ? true : false, context),
      myTab(2, (selectedTab == 2) ? true : false, context),
    ];
  }

  Tab myTab(int index, bool touched, BuildContext context) {
    final tabTextThemeColor = Theme.of(context).colorScheme.primary;

    return Tab(
        //  text: "ABC",
        icon: Container(
      decoration: tabDecor(context: context, isSelected: touched),
      //  tabBarDecor(isSelected: (selectedTab == 0) ? true : false),
      height: 45.0.h,
      child: Center(
          child: Label(txt: titles[index], type: TextTypes.f_14_450,forceColor: touched ? Colors.white : Colors.black,)
          
          // titles[index].withText(
          //     ofContext: context,
          //     ofType: TextType.deepMicroText,
          //     color: touched ? Colors.white : tabTextThemeColor)
              
              ),
    )

        //  tabView(isSelected: (selectedTab == 0) ? true :false),
        );
  }

  BoxDecoration tabDecor({required BuildContext context, required bool isSelected}) {
    return BoxDecoration(
      color: (isSelected)?
           AppColors.primary :Colors.white// .shade300,
,
      borderRadius: const BorderRadius.all(
          Radius.circular(5.0) //                 <--- border radius here
          ),
          boxShadow: const [BoxShadow(offset: Offset(1, 1), blurRadius: 1, color: Colors.white, spreadRadius: 1)],
          
    );
  }
}
