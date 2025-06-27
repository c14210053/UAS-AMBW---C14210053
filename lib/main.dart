import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/get_started_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'firebase_options.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, 
    );
    print("✅ Firebase initialized");
  } catch (e) {
    print("❌ Firebase init error: $e");
  }

  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('is_first_launch') ?? true;
  final isLoggedIn = prefs.getBool('is_logged_in') ?? false;

  runApp(MyApp(
    isFirstLaunch: isFirstLaunch,
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  final bool isLoggedIn;

  const MyApp({required this.isFirstLaunch, required this.isLoggedIn, super.key});

  @override
  Widget build(BuildContext context) {
    Widget startScreen;

    if (isFirstLaunch) {
      startScreen = const GetStartedScreen();
    } else if (isLoggedIn) {
      startScreen = const HomeScreen();
    } else {
      startScreen = const LoginScreen();
    }

    return MaterialApp(
      title: 'Mood Journal',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: startScreen,
    );
  }
}
