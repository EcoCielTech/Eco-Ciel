import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({super.key});

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            height: 400,
            width: double.infinity,
            color: Colors.black,
            child: Image.asset(
              "assets/images/map.jpeg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 440.0),
          child: Container(
            height: 400,
            width: double.infinity,
            color: Colors.black,
            child: Image.asset(
              "assets/images/map2.jpeg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: SpinKitRipple(
            size: 400,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(400),
                  color: index.isEven
                      ? const Color(0xFF008955)
                      : const Color.fromARGB(255, 131, 196, 171),
                ),
              );
            },
          ),
        ),
        // Center(
        //   child: Container(
        //     height: 220,
        //     width: 220,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(200),
        //     ),
        //   ),
        // ),
        const Center(
          child: SizedBox(
              height: 150,
              width: 150,
              child: Icon(
                Icons.location_on,
                size: 60,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
            left: 10,
            right: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                // obscureText: obsText,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Enter your location',
                  labelStyle: const TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors
                            .grey.shade400), // Change the border color on focus
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors
                            .grey.shade400), // Change the border color on focus
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              TextField(
                // obscureText: obsText,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Your Destination',
                  labelStyle: const TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors
                            .grey.shade400), // Change the border color on focus
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors
                            .grey.shade400), // Change the border color on focus
                  ),
                ),
              ),
            ],
          ),
        ),

        // Positioned(
        //   left: 0,
        //   right: 0,
        //   top: 480,
        //   child: Column(
        //     children: [
        //       txt(
        //         "No saved Chats",
        //         weight: FontWeight.w500,
        //         size: 24,
        //       ),
        //       txt(
        //         "Left swipe the chatbox to add....",
        //         color: Colors.grey.shade500,
        //         // weight: FontWeight.w500,
        //         size: 13,
        //       ),
        //     ],
        //   ),
        // ),
      ]),
    );
  }
}
