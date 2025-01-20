import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_chat/firebase_options.dart';
import 'package:push_chat/screens/auth/login_screen.dart';
// import 'package:push_chat/screens/home/home_screen.dart';
// import 'package:push_chat/screens/nav_bar/nav_bar.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
