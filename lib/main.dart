import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/home_page.dart';
import 'screens/chat_page.dart';
import 'screens/report_upload_page.dart';
import 'screens/history_page.dart';
import 'screens/settings_page.dart';
import 'screens/login_screen/login_screen.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // You'll configure this with your Firebase project settings
  );
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
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: kPrimaryColor),
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AuthWrapper(),
      routes: {
        '/home': (context) => HomePage(),
        '/chat': (context) => ChatPage(),
        '/upload': (context) => ReportUploadPage(),
        '/history': (context) => HistoryPage(),
        '/settings': (context) => SettingsPage(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Show loading spinner while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: kBackgroundColor,
            body: Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          );
        }
        
        // If user is logged in, show home page
        if (snapshot.hasData && snapshot.data != null) {
          return HomePage();
        }
        
        // If user is not logged in, show login screen
        return const LoginScreen();
      },
    );
  }
}
