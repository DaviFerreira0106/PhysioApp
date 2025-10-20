import 'package:flutter/material.dart';

enum IndexPage {
  home,
  chat,
  exercises,
  profile,
  addQuery,
}

class BottomNavBarController with ChangeNotifier {
  IndexPage _currentPage = IndexPage.home;

  IndexPage get getCurrentPage => _currentPage;

  void setCurrentPage({required IndexPage indexPage}) {
    _currentPage = indexPage;
    notifyListeners();
  }
}
