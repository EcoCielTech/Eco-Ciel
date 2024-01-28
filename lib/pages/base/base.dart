import 'package:ecociel/pages/base/controller/base_page_controller.dart';
import 'package:ecociel/pages/base/test_api.dart';
import 'package:ecociel/pages/base/test_ocr.dart';
import 'package:ecociel/pages/chart/stats_page.dart';
import 'package:ecociel/pages/homepage/controller/homepage_controller.dart';
import 'package:ecociel/pages/homepage/homepage.dart';
import 'package:ecociel/pages/profile/profile_page.dart';
import 'package:ecociel/pages/rewards/rewards_page.dart';
import 'package:ecociel/utils/text.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  List pages = [
    const HomePage(),
    RewardsPage(),
    StatsPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<BaseController>(context);
    return Scaffold(
      body: Consumer<BaseController>(
        builder: (context, data, child) {
          return pages[data.pageIndex];
        },
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: data.pageIndex,
        // selectedIndex: 0,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          data.newScreenIndex(index);
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(
              Icons.home,
              size: 30,
              color: Colors.black,
            ),
            title: txt(
              'Home',
              size: 15,
              weight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Icons.military_tech,
              size: 30,
              color: Colors.black,
            ),
            title: txt(
              'Challenges',
              size: 15,
              weight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Icons.bar_chart,
              size: 30,
              color: Colors.black,
            ),
            title: txt(
              'Stats',
              size: 15,
              weight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Icons.person,
              size: 30,
              color: Colors.black,
            ),
            title: txt(
              'Profile',
              size: 15,
              weight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(
      //         MaterialPageRoute(builder: (context) => PhotoCaptureScreen()));
      //   },
      //   backgroundColor: Colors.black,
      //   child: const Icon(
      //     Icons.document_scanner,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
