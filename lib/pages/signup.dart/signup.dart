import 'package:ecociel/pages/signin.dart/signin.dart';
import 'package:ecociel/utils/text.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<DropdownMenuItem<int>> get dropdownItems {
    List<DropdownMenuItem<int>> menuItems = [
      DropdownMenuItem(
        value: 15000,
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<15000"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<25000"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<50000"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<75000"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<100000"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<100000"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
                padding: const EdgeInsets.all(8.0),
                child: Text("Yes"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
                padding: const EdgeInsets.all(8.0),
                child: Text("No"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<10"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<25"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<50"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<75"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("<100"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(">100"),
              ),
            ],
          ),
          decoration: ShapeDecoration(
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

  @override
  Widget build(BuildContext context) {
    bool? value = false;
    return Scaffold(
      appBar: AppBar(
        title: txt(
          'Sign Up',
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
                'Signup with your email',
                weight: FontWeight.w400,
                size: 24,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                // obscureText: obsText,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Name',
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
                // obscureText: obsText,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Email',
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
                // obscureText: obsText,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Name',
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
                    'Monthly Income',
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
                    'Previous Community Event Organised',
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
                    'Previous Community Event Participation',
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
                    shape: CircleBorder(),
                    value: true,
                    checkColor: Colors.white,
                    activeColor: Color(0xFF008955),
                    onChanged: (bool? newValue) {},
                  ),
                  txt(
                    'By signing up. you agree to the ',
                    color: Colors.grey.shade400,
                    weight: FontWeight.w500,
                  ),
                  txt(
                    'Terms of ',
                    color: Color(0xFF008955),
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Row(
                  children: [
                    txt(
                      'services ',
                      color: Color(0xFF008955),
                      weight: FontWeight.w500,
                    ),
                    txt(
                      ' and ',
                      color: Colors.grey.shade400,
                      weight: FontWeight.w500,
                    ),
                    txt(
                      ' Privacy policy',
                      color: Color(0xFF008955),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF008955),
                  ),
                  child: Center(
                    child: txt("Sign up",
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
                        padding: EdgeInsets.all(10),
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
                        padding: EdgeInsets.all(10),
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
                        padding: EdgeInsets.all(10),
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
