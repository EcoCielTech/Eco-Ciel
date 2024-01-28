import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecociel/pages/chart/stats_page.dart';
import 'package:ecociel/pages/homepage/controller/homepage_controller.dart';
import 'package:ecociel/pages/homepage/widgets/grid_box.dart';
import 'package:ecociel/pages/homepage/widgets/list_tile.dart';
import 'package:ecociel/pages/profile/profile_page.dart';
import 'package:ecociel/pages/rewards/rewards_page.dart';
import 'package:ecociel/services/backend_services.dart';
import 'package:ecociel/utils/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Icon> icons = [
  const Icon(
    Icons.water_drop,
    size: 40,
  ),
  const Icon(
    Icons.device_thermostat,
    size: 40,
  ),
  const Icon(
    Icons.savings,
    size: 40,
  ),
  const Icon(
    Icons.sunny,
    size: 40,
  ),
];

List<Color> colors = [
  const Color(0xFFD9EAFA),
  const Color(0xffD9FCEB),
  const Color(0xffFFF2F7),
  const Color(0xffFFF1C8),
];

List<Color> badgeColors = [
  const Color(0xFFf0ead2),
  const Color(0xffdde5b6),
  const Color(0xffa98467),
  const Color(0xffcee5f2),
  const Color(0xffd1c8e1),
  const Color(0xffeddcd2),
  const Color(0xffa98467),
];

String lat = "";
String long = "";
String userName = "User"; // Default value
String? _currentAddress;
Position? _currentPosition;
List<String> text1 = ["", "", "", ""];

class _HomePageState extends State<HomePage> {
  BackendServices _backendServices = BackendServices();
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _loadUserName() async {
    String userEmail =
        _auth.currentUser!.email.toString(); // Replace with actual user email

    try {
      var userDataSnapshot = await FirebaseFirestore.instance
          .collection('userdata')
          .doc(userEmail)
          .get();

      if (userDataSnapshot.exists) {
        // Update the user name
        setState(() {
          userName = userDataSnapshot['name'] ?? "Mr. Kartikey";
        });
      }
    } catch (error) {
      print("Error loading user name: $error");
    }
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getWeatherData() async {
    final responseFromBackend = await _backendServices.getUVIndexandWeatherData(
        _currentPosition!.latitude.toString(),
        _currentPosition!.longitude.toString(),
        2.toString());
    text1 = [
      "${responseFromBackend['currentHumidity'].toString()} %",
      "${responseFromBackend['currentTemp'].toStringAsFixed(2)} °C",
      responseFromBackend['currentTemp'].toStringAsFixed(2),
      responseFromBackend['uvdata'].toStringAsFixed(2),
    ];

    print(responseFromBackend);
  }

  void intialize() async {
    await _getCurrentPosition();
    await _getWeatherData();
    await _loadUserName();
  }

  @override
  void initState() {
    intialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> badges = [
      AppLocalizations.of(context)!.green,
      AppLocalizations.of(context)!.esaver,
      AppLocalizations.of(context)!.advocate,
      AppLocalizations.of(context)!.citizens,
      AppLocalizations.of(context)!.leader,
      AppLocalizations.of(context)!.waterc,
      AppLocalizations.of(context)!.cleanec,
    ];
    List<String> badgesDescription = [
      AppLocalizations.of(context)!.greendescription,
      AppLocalizations.of(context)!.esaverdescription,
      AppLocalizations.of(context)!.advocatedescription,
      AppLocalizations.of(context)!.citizensdescription,
      AppLocalizations.of(context)!.leaderdescription,
      AppLocalizations.of(context)!.watercdescription,
      AppLocalizations.of(context)!.cleanecdescription,
    ];
    List<String> text2 = [
      AppLocalizations.of(context)!.humidity,
      AppLocalizations.of(context)!.temperature,
      AppLocalizations.of(context)!.coins,
      AppLocalizations.of(context)!.uv,
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          "Mr. ${toBeginningOfSentenceCase(userName)}",
                          size: 36,
                          weight: FontWeight.bold,
                        ),
                        txt(
                          AppLocalizations.of(context)!.welcome,
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
                txt("Recommended Challenges",
                    color: Colors.black, size: 24, weight: FontWeight.w600),
                Container(
                  width: 400,
                  height: 400,
                  child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return ListTileWidget(
                          color: badgeColors[index],
                          badgeDescription: badgesDescription[index],
                          badgeName: badges[index],
                          imageAsset: "assets/badges/badge${index + 1}.png",
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
