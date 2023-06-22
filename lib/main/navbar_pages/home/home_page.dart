import 'package:fablo/global/providers/auth_state_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.push('/account');
              },
              icon: const Icon(Icons.account_circle_outlined),
            ),
          ),
          const Spacer(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Home'),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed('read_story_page');
                  },
                  child: const Text('Read Story'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthStateRouter>().signOut();
                  },
                  child: const Text('Sign out'),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
