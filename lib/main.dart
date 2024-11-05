import 'package:flutter/material.dart';
import 'package:mewwing_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mewwing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2C5F2D),
          secondary: const Color(0xFFFFB200),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}