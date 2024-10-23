
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'note_model.dart';
class NoteDatabase extends ChangeNotifier{
static late Isar isar;
  //initialize
static Future<void>initialize()async{
  final dir=await getApplicationCacheDirectory();
  isar = await Isar.open([NoteModelSchema], directory: dir.path);
}

List<NoteModel>currentNote=[];
  //create
Future<void>addNote(String textFormUser)async{
  final newNote=NoteModel()..text=textFormUser;
  await isar.writeTxn(()=>isar.noteModels.put(newNote));
  fetchNotes();
}

  //read
Future<void>fetchNotes()async{
List<NoteModel>fetchedNotes=await isar.noteModels.where().findAll();
currentNote.clear();
currentNote.addAll(fetchedNotes);
notifyListeners();
}

  //update
Future<void>updateNotes(int id,String newText)async{
  final exitingNote=await isar.noteModels.get(id);
  if(exitingNote!=null){
    exitingNote.text=newText;
    await isar.writeTxn(()=>isar.noteModels.put(exitingNote));
    await fetchNotes();
  }
}

  //delete
Future<void>deleteNotes(int id)async{
  await isar.writeTxn(()=>isar.noteModels.delete(id));
  await fetchNotes();
}
}