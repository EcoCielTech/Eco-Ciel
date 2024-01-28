import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecociel/pages/base/base.dart';
import 'package:ecociel/pages/signin.dart/signin.dart';
import 'package:ecociel/utils/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final _auth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void submit(String email, String password, String name, double income,
      bool community, double pastParticipation) async {
    print(email);
    print(password);
    try {
      final UserCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("No Issued");
      await FirebaseFirestore.instance
          .collection('userdata')
          .doc(UserCredential.user!.email)
          .set({
        'name': name,
        'email': email,
        'password': password,
        'income': income,
        'community': community,
        'pastParticipation': pastParticipation,
        'ciel-coins': 0,
        'clean-energy-champion': 1,
        'currentchallengedaily': "",
        'currentchallengemonthly': "",
        'eco-commute': 1,
        'energy-saver': 1,
        'sustainable-shopper': 1,
      });
      print("User Created - ${UserCredential}");
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      print(e);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Base(),
      ),
    );
  }

  List<DropdownMenuItem<int>> get dropdownItems {
    List<DropdownMenuItem<int>> menuItems = [
      DropdownMenuItem(
        value: 15000,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<15000"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 25000,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<25000"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 50000,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<50000"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 75000,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<75000"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 95000,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<100000"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 100000,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<100000"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<bool>> get dropdownItemsCommunityEvents {
    List<DropdownMenuItem<bool>> menuItems = [
      DropdownMenuItem(
        value: true,
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context)!.yes),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: false,
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context)!.no),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<int>> get dropdownItemsCommunityEventParticipants {
    List<DropdownMenuItem<int>> menuItems = [
      DropdownMenuItem(
        value: 10,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<10"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 25,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<25"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 50,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<50"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 75,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<75"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 95,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("<100"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      DropdownMenuItem(
        value: 100,
        child: Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(">100"),
              ),
            ],
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
    ];
    return menuItems;
  }

  int selectedValue = 15000;
  int eventParticipantsPast = 10;
  bool selectedValueCommunity = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _communityController = TextEditingController();
  final TextEditingController _communityEventParticipantsController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool? value = false;
    return Scaffold(
      appBar: AppBar(
        title: txt(
          AppLocalizations.of(context)!.signup,
          weight: FontWeight.w500,
          size: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              txt(
                AppLocalizations.of(context)!.signupemail,
                weight: FontWeight.w400,
                size: 24,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _nameController,
                // obscureText: obsText,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.name,
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
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.email,
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
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                // obscureText: obsText,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.password,
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
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  txt(
                    AppLocalizations.of(context)!.income,
                    color: Colors.black87,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: selectedValue,
                  underline: null,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                    _incomeController.text = selectedValue.toString();
                  },
                  items: dropdownItems,
                  isExpanded: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  txt(
                    AppLocalizations.of(context)!.prevevents,
                    color: Colors.black87,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<bool>(
                  value: selectedValueCommunity,
                  onChanged: (bool? newValue) {
                    setState(() {
                      selectedValueCommunity = newValue!;
                    });
                    _communityController.text =
                        selectedValueCommunity.toString();
                  },
                  items: dropdownItemsCommunityEvents,
                  isExpanded: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  txt(
                    AppLocalizations.of(context)!.prevpart,
                    color: Colors.black87,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: eventParticipantsPast,
                  onChanged: (int? newValue) {
                    setState(() {
                      eventParticipantsPast = newValue!;
                    });
                    _communityEventParticipantsController.text =
                        eventParticipantsPast.toString();
                  },
                  items: dropdownItemsCommunityEventParticipants,
                  isExpanded: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    shape: const CircleBorder(),
                    value: true,
                    checkColor: Colors.white,
                    activeColor: const Color(0xFF008955),
                    onChanged: (bool? newValue) {},
                  ),
                  txt(
                    AppLocalizations.of(context)!.terms,
                    color: Colors.grey.shade400,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  children: [
                    txt(
                      AppLocalizations.of(context)!.terms,
                      color: const Color(0xFF008955),
                      weight: FontWeight.w500,
                    ),
                    txt(
                      "${AppLocalizations.of(context)!.and} ",
                      color: Colors.grey.shade400,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  children: [
                    txt(
                      AppLocalizations.of(context)!.privacy,
                      color: const Color(0xFF008955),
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  submit(
                      _emailController.text,
                      _passwordController.text,
                      _nameController.text,
                      selectedValue.toDouble(),
                      selectedValueCommunity,
                      eventParticipantsPast.toDouble());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SignInPage(),
                  //   ),
                  // );
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF008955),
                  ),
                  child: Center(
                    child: txt(AppLocalizations.of(context)!.signup,
                        color: Colors.white, weight: FontWeight.w600, size: 24),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    height: 2,
                    width: 170,
                    color: Colors.grey.shade400,
                  ),
                  txt(
                    " or ",
                    color: Colors.grey.shade400,
                  ),
                  Container(
                    height: 2,
                    width: 170,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/icons/google.png",
                          // fit: BoxFit.fill,
                        )),
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/icons/facebook.png")),
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/icons/apple-logo.png")),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
