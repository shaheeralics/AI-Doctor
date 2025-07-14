import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/chat_page.dart';
import 'screens/report_upload_page.dart';
import 'screens/history_page.dart';
import 'screens/settings_page.dart';
import 'screens/login_screen/login_screen.dart';
import 'utils/constants.dart';

void main() {
  runApp(const AIDoctorApp());
}

class AIDoctorApp extends StatelessWidget {
  const AIDoctorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Doctor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kPrimaryColor,
              fontFamily: 'Montserrat',
            ),
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => HomePage(),
        '/chat': (context) => ChatPage(),
        '/upload': (context) => ReportUploadPage(),
        '/history': (context) => HistoryPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
