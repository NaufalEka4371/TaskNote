import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/note_model.dart';
import '../services/storage_service.dart';

class NoteController extends GetxController {
  final notes = <NoteModel>[].obs;

  final storage = StorageService(); // gunakan instance

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

  Future<void> loadNotes() async {
    final data = await storage.loadNotes(); // FIXED
    notes.value = data;
  }

  Future<void> saveNotes() async {
    await storage.saveNotes(notes.toList()); // FIXED
  }

  // Tambah catatan baru
  void addNoteDialog() {
    final titleC = TextEditingController();

    Get.defaultDialog(
      title: 'Buat Catatan Baru',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleC,
            decoration: const InputDecoration(labelText: 'Judul Catatan'),
          ),
        ],
      ),
      textConfirm: 'Simpan',
      textCancel: 'Batal',
      onConfirm: () {
        final title = titleC.text.trim();
        if (title.isEmpty) return;

        final newNote = NoteModel(
          id: DateTime.now().millisecondsSinceEpoch,
          title: title,
          content: "",
          createdAt: DateTime.now(),
        );

        notes.add(newNote);
        saveNotes();
        Get.back();
      },
    );
  }

  // Update isi catatan
  void updateContent(int id, String newContent) {
    final idx = notes.indexWhere((n) => n.id == id);
    if (idx == -1) return;

    notes[idx] = notes[idx].copyWith(content: newContent);
    saveNotes();
  }

  // Hapus note
  void delete(int id) {
    notes.removeWhere((n) => n.id == id);
    saveNotes();
  }
}
