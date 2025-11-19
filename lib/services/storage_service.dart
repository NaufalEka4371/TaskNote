import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note_model.dart';
import '../models/deadline_model.dart';

class StorageService {
  static const _notesKey = "NOTES";
  static const _deadlinesKey = "DEADLINES";

  Future<List<NoteModel>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_notesKey);
    if (jsonString == null) return [];
    final List decoded = jsonDecode(jsonString);
    return decoded.map((e) => NoteModel.fromJson(e)).toList();
  }

  Future<void> saveNotes(List<NoteModel> notes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      _notesKey,
      jsonEncode(notes.map((e) => e.toJson()).toList()),
    );
  }

  Future<List<DeadlineModel>> loadDeadlines() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_deadlinesKey);
    if (jsonString == null) return [];
    final List decoded = jsonDecode(jsonString);
    return decoded.map((e) => DeadlineModel.fromJson(e)).toList();
  }

  Future<void> saveDeadlines(List<DeadlineModel> deadlines) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      _deadlinesKey,
      jsonEncode(deadlines.map((e) => e.toJson()).toList()),
    );
  }
}
