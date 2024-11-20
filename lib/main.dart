import 'package:flutter/material.dart';
import 'package:mewwing_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CookieRequest>(
          create: (_) => CookieRequest(),
        ),
      ],
      child: MaterialApp(
          title: 'mewwing',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF2C5F2D),
              secondary: const Color(0xFFFFB200),
            ),
            useMaterial3: true,
          ),
          home: const LoginPage()),
    );
  }
}