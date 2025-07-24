// Import Flutter material package for UI components
import 'package:flutter/material.dart';
// Import the initial loading screen
import 'screens/loading_screen.dart';

// Entry point of the application
void main() {
  runApp(MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set up the app theme and initial screen
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: LoadingScreen(),
    );
  }
}
