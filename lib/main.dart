import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Flutter'),
        ),
        body: Stack( // <--- Change Scaffold body to a Stack
          children: <Widget>[
            Positioned( // <--- Wrap your Text in a Positioned widget
              top: 50.0, // Adjust this value for distance from the top in pixels
              left: 20.0, // Adjust this value for distance from the left in pixels
              // Or you can use 'right' for alignment from the right side:
              // right: 20.0,

              child: const Text( // Your 'Login' text
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
            // You can add other widgets here if you want to layer them
            // For example, another text field or an image
          ],
        ),
      ),
    );
  }
}