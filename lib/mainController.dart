import 'package:flutter/material.dart';

class MainController with ChangeNotifier {
  String language = "en";
  // final List<Widget> screens = [
  //   const OrganisationPage(),
  //   const ChatPage(),
  //   const SavedChats(),
  // ];

  void lang(String langua) {
    language = langua;
    notifyListeners();
  }
}
