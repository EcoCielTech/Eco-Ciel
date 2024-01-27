import 'dart:collection';

import 'package:flutter/material.dart';

class SignInPageController with ChangeNotifier {
  int pageIndex = 1;
  // final List<Widget> screens = [
  //   const OrganisationPage(),
  //   const ChatPage(),
  //   const SavedChats(),
  // ];

  void newScreenIndex(int newScreenIndex) {
    pageIndex = newScreenIndex;
    notifyListeners();
  }
}