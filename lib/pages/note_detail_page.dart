import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import '../models/note_model.dart';

class NoteDetailPage extends StatelessWidget {
  final NoteModel note;
  const NoteDetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NoteController>();
    final contentC = TextEditingController(text: note.content);

    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              controller.updateContent(note.id, contentC.text);
              Get.snackbar('Tersimpan', 'Isi catatan berhasil diperbarui!');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: contentC,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Tulis isi catatan di sini...',
          ),
        ),
      ),
    );
  }
}
