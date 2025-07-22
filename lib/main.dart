import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import screens
import 'screens/login_screen/login_screen.dart';
import 'screens/sign_up_screen/sign_up_screen.dart';
import 'screens/chat_screen/chat_screen.dart';

void main() {
  runApp(const AIDocConnectApp());
}

class AIDocConnectApp extends StatelessWidget {
  const AIDocConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: 'AI DocConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.blue[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
        ),
      ),

      // 👇 Show LoginScreen first
      initialRoute: '/',

      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/chat': (context) => const ChatScreen(),
      },
    );
  }
}
