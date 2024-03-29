import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ludo/getx_controllers/contests_controller.dart';
import 'package:ludo/getx_controllers/play_game_controller.dart';
import 'package:ludo/screens/play_screen.dart';

import '../authentication_screens/login_screen.dart';
import '../getx_controllers/dashboard_controller.dart';
import '../side_navigation_screens/games_hisory.dart';
import '../side_navigation_screens/home_screen.dart';
import '../side_navigation_screens/profile_screen.dart';
import '../side_navigation_screens/support_screen.dart';
import '../utils/app_colors.dart';
import '../utils/common.dart';
import 'contest_screen.dart';
import 'earnings_screen.dart';
import 'my_wallet.dart';
import 'notifications_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final DashboardController controller = Get.find<DashboardController>();
  late List<Widget> screens = [];
  final Map<Widget, String> sideNavData = {
    const Icon(
      Icons.home_outlined,
      color: customTextBodyColor,
    ): "Home",
    SvgPicture.asset("assets/person_icon.svg"): "My Profile",
    SvgPicture.asset("assets/earnings_icon.svg"): "Earnings",
    SvgPicture.asset("assets/wallet_icon.svg"): "My Wallet",
    SvgPicture.asset("assets/games_history_icon.svg"): "Games History",
    SvgPicture.asset("assets/notifications_icon.svg"): "Notifications",
    SvgPicture.asset("assets/support_icon.svg"): "Support",
    SvgPicture.asset("assets/logout_icon.svg"): "Logout",
  };

  @override
  void initState() {
    screens = [
      HomeScreen(
        dashboardController: controller,
      ),
      const ProfileScreen(),
      const EarningsScreen(),
      const MyWalletScreen(),
      const GamesHistory(),
      const NotificationsScreen(),
      const SupportScreen(),
      const SizedBox.shrink(),
      ContestScreen(
        dashboardController: controller,
      ),
      PlayScreen(
        dashboardController: controller,
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: SvgPicture.asset("assets/drawer_icon.svg")),
            const SizedBox(
              width: 10,
            ),
            Text(
              "LUDO",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(
                fontSize: 23,
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: appBlueColor,
        actions: [
          Container(
            decoration: BoxDecoration(
                color: containerBgColor,
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: SvgPicture.asset(
                        "assets/cash_icon.svg",
                        width: 25,
                        height: 25,
                      ),
                    ),
                    const WidgetSpan(
                        child: SizedBox(
                          width: 8,
                        )),
                    WidgetSpan(
                        child: Column(
                          children: [
                            Text(
                              "Cash",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,
                            ),
                            Text(
                              "500",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: containerBgColor,
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: SvgPicture.asset(
                        "assets/earnings_icon.svg",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const WidgetSpan(
                        child: SizedBox(
                          width: 8,
                        )),
                    WidgetSpan(
                        child: Column(
                          children: [
                            Text(
                              "Earning",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,
                            ),
                            Text(
                              "2000",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() =>
          Container(
            width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: Common.gradientBackground(allScreensBgColor)),
              child: screens[controller.index.value])),
      drawer: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(25), topRight: Radius.circular(25)),
        child: Container(
          decoration: BoxDecoration(
            gradient: Common.gradientBackground(sideNavBgColor),
          ),
          child: Drawer(
              backgroundColor: Colors.transparent,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.5,
              child: ListView.separated(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                itemCount: sideNavData.length,
                separatorBuilder: (_, __) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Divider(
                      height: 0.5,
                      color: Colors.white,
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      sideNavData.values.elementAt(index),
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                    horizontalTitleGap: 0,
                    leading: sideNavData.keys.elementAt(index),
                    onTap: () {
                      scaffoldKey.currentState?.closeDrawer();
                        Get.delete<PlayGameController>();
                        Get.delete<ContestsController>();
                        controller.index.value = index;
                      if (index == 7) {
                        Get.offAll(() => const LoginScreen());
                      }
                      // Update the state of the app.
                      // ...
                    },
                  );
                },
              )),
        ),
      ),
    );
  }
}
