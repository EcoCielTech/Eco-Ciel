import 'dart:collection';

import 'package:flutter/material.dart';

class HomePageController with ChangeNotifier {
  int pageIndex =4;
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
