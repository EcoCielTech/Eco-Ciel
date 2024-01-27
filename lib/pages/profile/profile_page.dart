import 'package:ecociel/utils/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: txt(
          'Profile',
          weight: FontWeight.w500,
          size: 24,
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout, size: 30),
          ),
        ],
      ),
      body: Center(
        child: txt("asd"),
      ),
    );
  }
}
