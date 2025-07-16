import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // title: A description for the device's task switcher
        debugShowCheckedModeBanner: false,
        title: 'Flutter Widgets Demo',
        // theme: Defines the overall visual theme of the app
        theme: ThemeData(
          primarySwatch: Colors.blue, // Sets a primary color and its shades
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.indigo, // Custom AppBar background
            foregroundColor: Colors.white, // Custom AppBar text/icon color
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
            headlineSmall:
                TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          useMaterial3: true, // Opt-in to Material 3 design
        ),
        // home: The first widget displayed when the app starts
        home: Scaffold(
            appBar: AppBar(
              title: const Text('AI DOCTOR'
              selectionColor: Color.fromARGB(22, 12, 12, 25),
              ),
              backgroundColor: Color.fromARGB(255, 93, 221, 241),
            ),
            backgroundColor: const Color.fromARGB(255, 202, 245, 252),
            // defining the column

            body: const Column(
              //Padding from sides,)
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                ),

                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(157, 0, 0, 0)),
                ),
                // padding from top
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),

                // text for email
                Text(
                  'Email',
                  style: TextStyle(fontSize: 16.0),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),

                //textfield for email with outer boudary line and padding from side
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),

                //text for password
                Text('Password', style: TextStyle(fontSize: 16.0)),

                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 25),
                ),

                // button for login
                ElevatedButton(
                  onPressed: null,
                  child: Text('Login'),
                )
              ],
            )));
  }
}
