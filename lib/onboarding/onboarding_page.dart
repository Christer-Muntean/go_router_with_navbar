import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const <Widget>[
          Center(
            child: Text('OnBoarding\nFirst Page'),
          ),
          Center(
            child: Text('OnBoarding\nSecond Page'),
          ),
          Center(
            child: Text('OnBoarding\nThird Page'),
          ),
        ],
      ),
    );
  }
}
