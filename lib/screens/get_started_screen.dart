import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  void _goToLogin(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_first_launch', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _goToLogin(context),
          child: const Text("Get Started"),
        ),
      ),
    );
  }
}