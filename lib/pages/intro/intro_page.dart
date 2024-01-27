import 'package:ecociel/pages/signup.dart/signup.dart';
import 'package:ecociel/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.only(top: 200.0, right: 8.0, left: 8.0),
          child: OnBoarding()
          //  Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Container(
          //       child: Image.asset("assets/svg/intro1.png"),
          //     ),
          //     const SizedBox(
          //       height: 20,
          //     ),
          //     txt(
          //       "Request Ride",
          //       weight: FontWeight.w500,
          //       size: 24,
          //     ),
          //     const SizedBox(
          //       height: 20,
          //     ),
          //     txt(
          //       'Request a ride get picked up a nearby driver',
          //       weight: FontWeight.w400,
          //       size: 22,
          //     ),
          //     const SizedBox(
          //       height: 150,
          //     ),
          //     SizedBox(
          //       height: 10,
          //       width: 50,
          //       child: ListView.separated(
          //         scrollDirection: Axis.horizontal,
          //         separatorBuilder: (context, index) => const SizedBox(
          //           width: 10,
          //           height: 10,
          //         ),
          //         itemCount: 3,
          //         itemBuilder: ((context, index) {
          //           return Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Colors.black,
          //             ),
          //             width: 10,
          //             height: 10,
          //           );
          //         }),
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     txt(
          //       "Skip",
          //       size: 18,
          //     )
          //   ],
          // ),
          ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      pageBackgroundColor: Colors.white,
      headerBackgroundColor: Colors.white,
      finishButtonText: 'Register',
      onFinish: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpPage(),
        ),
      ),
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Colors.black,
      ),
      // skipTextButton: Text('Skip'),
      // trailing: Text('Login'),
      background: [
        SizedBox(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ],
      // background: [
      //   Image.asset('assets/svg/intro1.png'),
      //   Image.asset('assets/svg/intro1.png'),
      //   // Image.asset('assets/slide_2.png'),
      // ],
      totalPage: 4,
      speed: 1.8,
      pageBodies: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('assets/svg/intro1.png'),
              ),
              const SizedBox(
                height: 54,
              ),
              txt(
                "Request Ride",
                weight: FontWeight.w500,
                size: 24,
              ),
              const SizedBox(
                height: 20,
              ),
              txt(
                'Request a ride get picked up a nearby driver',
                weight: FontWeight.w400,
                size: 22,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('assets/svg/intro2.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              txt(
                "Realtime Tracking",
                weight: FontWeight.w500,
                size: 24,
              ),
              const SizedBox(
                height: 20,
              ),
              txt(
                'Know your driver in advance and be able to view current location real on the map',
                weight: FontWeight.w400,
                size: 16,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              Container(
                // height: 200,
                // width: 200,
                child: Image.asset(
                  'assets/svg/intro3.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // SizedBox(
              //   height: 350 - 16,
              // ),
              txt(
                "Earn Money",
                weight: FontWeight.w500,
                size: 24,
              ),
              const SizedBox(
                height: 20,
              ),
              txt(
                'Give Rides nearby by passenger, use promo code & earn money',
                weight: FontWeight.w400,
                size: 22,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('assets/svg/intro4.png'),
              ),
              SizedBox(
                height: 10,
              ),
              txt(
                "Enable Location",
                weight: FontWeight.w500,
                size: 24,
              ),
              const SizedBox(
                height: 10,
              ),
              txt(
                'Enable your locatiob to start find the request around you',
                weight: FontWeight.w400,
                size: 22,
              ),
              // const SizedBox(
              //   height: 150,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
