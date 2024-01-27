import 'package:ecociel/pages/chart/stats_page.dart';
import 'package:ecociel/pages/homepage/controller/homepage_controller.dart';
import 'package:ecociel/pages/homepage/widgets/grid_box.dart';
import 'package:ecociel/pages/profile/profile_page.dart';
import 'package:ecociel/pages/rewards/rewards_page.dart';
import 'package:ecociel/utils/text.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Icon> icons = [
  const Icon(
    Icons.public,
    size: 40,
  ),
  const Icon(
    Icons.payments,
    size: 40,
  ),
  const Icon(
    Icons.balance,
    size: 40,
  ),
  const Icon(
    Icons.flag,
    size: 40,
  ),
];
List<String> text1 = ["02", "₹ 1000", "28kg", "1800"];
List<String> text2 = [
  "Level Achieved",
  "Total Earned",
  "Total NBD Trashed",
  "Total Points"
];
List<Color> colors = [
  const Color(0xFFD9EAFA),
  const Color(0xffD9FCEB),
  const Color(0xffFFF2F7),
  const Color(0xffFFF1C8),
];


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            size: 30,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        txt(
                          "Mr. Kartikey",
                          size: 36,
                          weight: FontWeight.bold,
                        ),
                        txt(
                          "Welcome Back",
                          size: 18,
                          weight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/profile_image1.png",
                      height: 80,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 40.0,
                    mainAxisSpacing: 40.0,
                  ),
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GridBoxWidget(
                      text1: text1[index],
                      text2: text2[index],
                      icon: icons[index],
                      color: colors[index],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    txt("Today's Board",
                        color: Colors.black, size: 24, weight: FontWeight.w600),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFADC),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 30,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          txt(
                            "Daily Activity Level",
                            size: 12,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}
