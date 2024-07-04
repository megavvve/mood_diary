import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  String _notes = '';

  String get notes => _notes;

  void setNotes(String newNotes) {
    _notes = newNotes;
    notifyListeners();
  }
}
