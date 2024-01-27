import 'package:ecociel/pages/homepage/homepage.dart';
import 'package:ecociel/utils/text.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool? value = false;
    return Scaffold(
      appBar: AppBar(
        title: txt(
          'Sign In',
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
                'Signin with your email or phone number',
                weight: FontWeight.w400,
                size: 24,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 160,
              ),
              TextField(
                // obscureText: obsText,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Email or phone number',
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
                  labelText: 'Enter your password',
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  txt(
                    "Forget Password?",
                    color: Colors.red,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              const SizedBox(
                height: 130,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
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
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  txt(
                    'Don\'t have an account? ',
                    weight: FontWeight.w500,
                  ),
                  txt(
                    'Sign Up ',
                    weight: FontWeight.w500,
                    color: Color(0xFF008955),
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
