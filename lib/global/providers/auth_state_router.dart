import 'package:flutter/material.dart';

enum MainPages {
  onBoarding(name: '/on_boarding'),
  signIn(name: '/sign_in'),
  home(name: '/home');

  const MainPages({required this.name});

  final String name;
}

class AuthStateRouter extends ChangeNotifier {
  AuthStateRouter() {
    _initialize();
  }

  MainPages? currentPage;
  bool userIsSignedIn = false;

  void _initialize() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        currentPage = MainPages.onBoarding;
        notifyListeners();
      },
    );

    await Future.delayed(
      const Duration(seconds: 1),
      () {
        currentPage = MainPages.signIn;
        notifyListeners();
      },
    );
    await Future.delayed(
      const Duration(seconds: 1),
          () {
        currentPage = MainPages.home;
        userIsSignedIn = true;
        notifyListeners();
      },
    );
  }

  void signOut(){
    userIsSignedIn = false;
    currentPage = MainPages.signIn;
    notifyListeners();
  }

  void signIn(){
    userIsSignedIn = true;
    currentPage = MainPages.home;
    notifyListeners();
  }
}
