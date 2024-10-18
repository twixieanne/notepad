import 'package:test/components/notepad_tiles.dart';
import 'package:test/pages/firebase_flutter.dart';
import 'package:test/pages/gemini_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cool Website'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyTiles(
              text: 'Flutter Firebase',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FirebaseFlutter(),
                ),
              ),
            ),
            MyTiles(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GeminiFlutter(),
                ),
              ),
              text: 'Flutter Gemini API',
            ),
          ],
        ),
      ),
    );
  }
  
  MyTiles({required Future Function() onTap, required String text}) {}
}
