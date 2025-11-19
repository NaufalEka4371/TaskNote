import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/deadline_controller.dart';

class DeadlinePage extends StatelessWidget {
  DeadlinePage({super.key});

  final dlC = Get.put(DeadlineController());

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    DateTime selected = DateTime.now();

    return Scaffold(
      appBar: AppBar(title: const Text("Deadline")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (c) => AlertDialog(
              title: const Text("Tambah Deadline"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: title,
                    decoration: const InputDecoration(labelText: "Judul"),
                  ),
                  TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
                      );
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (date != null && time != null) {
                        selected = DateTime(
                          date.year,
                          date.month,
                          date.day,
                          time.hour,
                          time.minute,
                        );
                      }
                    },
                    child: const Text("Pilih Tanggal & Jam"),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text("Batal"),
                ),
                ElevatedButton(
                  onPressed: () {
                    dlC.add(title.text, selected);
                    Get.back();
                  },
                  child: const Text("Simpan"),
                ),
              ],
            ),
          );
        },
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: dlC.deadlines.length,
          itemBuilder: (c, i) {
            final d = dlC.deadlines[i];
            return ListTile(
              title: Text(d.title),
              subtitle: Text(d.dateTime.toString()),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => dlC.delete(d.id),
              ),
            );
          },
        ),
      ),
    );
  }
}
