import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import 'note_detail_page.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());

    return Scaffold(
      appBar: AppBar(title: const Text('Catatan')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => controller.addNoteDialog(),
      ),
      body: Obx(() {
        final notes = controller.notes;
        if (notes.isEmpty) {
          return const Center(child: Text('Belum ada catatan'));
        }
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, i) {
            final note = notes[i];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(
                note.content.isEmpty ? 'Belum ada isi' : note.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => Get.to(() => NoteDetailPage(note: note)),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => controller.delete(note.id),
              ),
            );
          },
        );
      }),
    );
  }
}
