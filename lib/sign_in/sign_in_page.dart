import 'package:fablo/global/cubits/auth_state_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign in page'),
            ElevatedButton(
              onPressed: () {
                context.read<AuthStateRouter>().signIn();
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
