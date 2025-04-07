import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile.dart';
import 'register.dart';
import 'Consult_Screen.dart';
import 'setting_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
         '/': (context) => const RegisterScreen(),
        '/home': (context) =>const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/consult': (context) => const ConsultScreen(),
        '/register': (context) => const RegisterScreen(),
        '/settings': (context) => const SettingsPage2(),
      },
    );
  }
}
