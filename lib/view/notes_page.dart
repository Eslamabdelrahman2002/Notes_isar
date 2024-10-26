import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_isar/components/my_drawer.dart';
import 'package:notes_isar/components/note_title.dart';
import 'package:notes_isar/models/note_database.dart';
import 'package:notes_isar/models/note_model.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  // @override
  // void dispose() {
  //   textController.dispose();
  //   super.dispose();
  // }

  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  void updateNote(NoteModel note) {
    textController.text = note.text;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Note'),
        content: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<NoteDatabase>().updateNotes(note.id, textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  void delete(int id) {
    context.read<NoteDatabase>().deleteNotes(id);
  }

  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Note'),
        content: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<NoteDatabase>().addNote(textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    List<NoteModel> currentNotes = noteDatabase.currentNote;

    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                final note = currentNotes[index];
                return NoteTitle(
                  text: note.text,
                  onEditPressed: () => updateNote(note),
                  onDeletePressed: () => delete(note.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
