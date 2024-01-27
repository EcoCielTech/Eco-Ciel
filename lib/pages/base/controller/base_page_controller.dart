
import 'package:flutter/material.dart';

class BaseController with ChangeNotifier {
  int pageIndex = 0;
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
