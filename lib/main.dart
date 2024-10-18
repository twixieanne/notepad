import 'package:firebase_core/firebase_core.dart';
import 'package:test/components/notepad_tiles.dart';
import 'package:test/firebase_options.dart';
import 'package:test/pages/firebase_flutter.dart';
import 'package:test/pages/gemini_flutter.dart';
import 'package:test/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 42, 37),
        appBarTheme: AppBarTheme(
          centerTitle: false,
          backgroundColor: const Color.fromARGB(255, 243, 207, 8),
          elevation: 2,
          titleTextStyle: GoogleFonts.openSans(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            iconColor: const WidgetStatePropertyAll(
              Color.fromARGB(255, 215, 215, 215),
            ),
            backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ),
      home: FirebaseFlutter(),
    );
  }
}
