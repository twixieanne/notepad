import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotepadTile extends StatelessWidget {
  final String title;
  final String body;
  NotepadTile({
    super.key,
    required this.body,
    required this.title, required String content,
  });

  final TextStyle style = GoogleFonts.comicNeue();
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 99, 91, 66),
      child: ListTile(
        tileColor: const Color.fromARGB(255, 9, 134, 74),
        title: Text(
          title.toUpperCase(),
          style: style.copyWith(fontSize: 30),
        ),
        subtitle: Text(
          'Body: $body',
          style: style.copyWith(fontSize: 25),
        ),
      ),
    );

  }
}