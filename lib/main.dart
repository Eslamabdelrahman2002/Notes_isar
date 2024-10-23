import 'package:flutter/material.dart';
import 'package:notes_isar/models/note_database.dart';
import 'package:notes_isar/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'view/notes_page.dart';

void main() async {
  // Ensure that Flutter's engine is initialized before interacting with any plugins
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize NoteDatabase
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteDatabase(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(builder:(context,ThemeProvider,child){
      return MaterialApp(
        theme: ThemeProvider.themeDate,
        debugShowCheckedModeBanner: false,
        home: NotesPage(),
      );
    } );
  }
}
