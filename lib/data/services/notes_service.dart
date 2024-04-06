import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import '../models/note.dart';

class NotesService extends ChangeNotifier {
  List<Note> _notes = [];
  final Preference<List<String>> _notesPref;

  NotesService(StreamingSharedPreferences preferences)
      : _notesPref = preferences.getStringList(
          'notes',
          defaultValue: [],
        ) {
    _loadNotes();
  }

  List<Note> get notes => _notes;

  void _loadNotes() {
    _notes =
        _notesPref.getValue().map((e) => Note.fromJson(jsonDecode(e))).toList();
    _notesPref.listen((list) {
      _notes = list.map((e) => Note.fromJson(jsonDecode(e))).toList();
      notifyListeners();
    });
  }

  void addNote(Note note) {
    _notes.add(note);
    _notesPref
        .setValue(_notes.map((note) => jsonEncode(note.toJson())).toList());
  }

  void removeNoteById(String id) {
    _notes.removeWhere((note) => note.id == id);
    _notesPref
        .setValue(_notes.map((note) => jsonEncode(note.toJson())).toList());
  }

  void updateNoteById(String id, Note note) {
    final index = _notes.indexWhere((note) => note.id == id);
    _notes[index] = note;
    _notesPref
        .setValue(_notes.map((note) => jsonEncode(note.toJson())).toList());
  }
}
