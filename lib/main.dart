import 'package:flutter/material.dart';
import 'auth/splash_screen.dart';
import 'screens/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArtConnect',
      home: const SplashScreen(),
      routes: {
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}
