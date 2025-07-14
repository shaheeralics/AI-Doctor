import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AI Doctor Home')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.chat),
              label: Text('Start Consultation'),
              onPressed: () => Navigator.pushNamed(context, '/chat'),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              icon: Icon(Icons.upload_file),
              label: Text('Upload Report'),
              onPressed: () => Navigator.pushNamed(context, '/upload'),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              icon: Icon(Icons.history),
              label: Text('View History'),
              onPressed: () => Navigator.pushNamed(context, '/history'),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
            ),
          ],
        ),
      ),
    );
  }
}
