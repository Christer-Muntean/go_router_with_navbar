import 'package:flutter/material.dart';

class ReadStoryPage extends StatefulWidget {
  const ReadStoryPage({Key? key}) : super(key: key);

  @override
  State<ReadStoryPage> createState() => _ReadStoryPageState();
}

class _ReadStoryPageState extends State<ReadStoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Read Story'),
      ),
    );
  }
}
