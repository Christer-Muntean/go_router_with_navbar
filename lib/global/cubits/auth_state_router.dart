import 'package:flutter_bloc/flutter_bloc.dart';

enum MainPages {
  onBoarding(name: '/on_boarding'),
  signIn(name: '/sign_in'),
  home(name: '/home');

  const MainPages({required this.name});

  final String name;
}

class AuthStateRouter extends Cubit<MainPages> {
  MainPages? currentPage;
  bool userIsSignedIn = false;

  AuthStateRouter(super.initialState){
    _initialize();
  }

  void _initialize() async {

    await Future.delayed(
      const Duration(seconds: 3),
      () {
        emit(MainPages.onBoarding);
      },
    );

    await Future.delayed(
      const Duration(seconds: 3),
      () {
        emit(MainPages.signIn);
      },
    );
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        emit(MainPages.home);
      },
    );
  }

  void signOut() {
    userIsSignedIn = false;
    emit(MainPages.signIn);
  }

  void signIn() {
    userIsSignedIn = true;
    emit(MainPages.home);
  }
}
