import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/components/notepad_tiles.dart';
import 'package:test/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirebaseFlutter extends StatelessWidget {
  FirebaseFlutter({super.key});

  final Firestore notepad = Firestore();
  final TextEditingController _textEditingControllerNoteTitle =
      TextEditingController();
  final TextEditingController _textEditingControllerNoteContent =
      TextEditingController();

  final InputDecoration _inputDecoration = const InputDecoration(
    border: OutlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    void onSubmit() {
      notepad.addNote(
        title: _textEditingControllerNoteTitle.text,
        content: _textEditingControllerNoteContent.text,
      );
      _textEditingControllerNoteTitle.clear();
      _textEditingControllerNoteContent.clear();
      Navigator.pop(context);
    }

    void dialogBox() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Add a new note',
              style: GoogleFonts.openSans(fontSize: 28),
            ),
            icon: const Icon(
              Icons.note_add,
              size: 75,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            backgroundColor: const Color.fromARGB(255, 222, 209, 90),
            content: SingleChildScrollView(
              child: SizedBox(
                height: screenH * .25, // Adjusted height to fit better
                width: screenW * .8,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensure minimal space usage
                  children: [
                    TextField(
                      controller: _textEditingControllerNoteTitle,
                      onSubmitted: (_) => onSubmit(),
                      decoration: _inputDecoration.copyWith(
                        hintText: 'Note title...',
                        hintStyle: GoogleFonts.lato(),
                        icon: const Icon(Icons.title),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _textEditingControllerNoteContent,
                      onSubmitted: (_) => onSubmit(),
                      decoration: _inputDecoration.copyWith(
                        hintText: 'Note content...',
                        hintStyle: GoogleFonts.lato(),
                        icon: const Icon(Icons.description),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Icon(Icons.save),
                onPressed: () => onSubmit(),
              ),
            ],
          );
        },
      );
    }

    final Widget floatingActionButton = FloatingActionButton(
      onPressed: () => dialogBox(),
      backgroundColor: const Color.fromARGB(255, 243, 207, 8),
      child: const Icon(Icons.add),
    );

    final Widget scaffoldContent = Center(
      child: Container(
        height: screenH,
        width: screenW * .5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 31, 42, 37),
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder(
            stream: notepad.getNotes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No notes added yet'));
              }

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = snapshot.data!.docs[index];
                  String title = document['title'];
                  String content = document['content'];

                  return NotepadTile(
                    title: title,
                    content: content,
                    body: '',
                  );
                },
              );
            },
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Notepad App'),
      ),
      body: scaffoldContent,
      floatingActionButton: floatingActionButton,
    );
  }
}

class Firestore {
  // Mock method to demonstrate adding a note.
  void addNote({
    required String title,
    required String content,
  }) {
    // Code to add a note to Firestore goes here.
  }

  // Mock method to demonstrate fetching notes from Firestore.
  Stream<QuerySnapshot> getNotes() {
    // Code to fetch notes from Firestore goes here.
    return Stream.empty();
  }
}
