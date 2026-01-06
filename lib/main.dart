import 'package:flutter/material.dart';
// This import connects your main app to the Dashboard we just built
import 'features/expert_dashboard/presentation/expert_dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krushi Kranti Expert',
      debugShowCheckedModeBanner: false, // Removes the red "Debug" banner
      theme: ThemeData(
        // Sets the primary color to Green to match your designs
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      // This line is key: It tells the app to start with your new Dashboard screen
      home: const ExpertDashboardScreen(),
    );
  }
}