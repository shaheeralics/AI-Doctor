import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/chat_page.dart';
import 'screens/report_upload_page.dart';
import 'screens/history_page.dart';
import 'screens/settings_page.dart';

void main() {
  runApp(AIDoctorApp());
}

class AIDoctorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Doctor',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        '/chat': (context) => ChatPage(),
        '/upload': (context) => ReportUploadPage(),
        '/history': (context) => HistoryPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
