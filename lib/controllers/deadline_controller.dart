import 'package:get/get.dart';
import '../models/deadline_model.dart';
import '../services/storage_service.dart';
import '../services/notification_service.dart';

class DeadlineController extends GetxController {
  final storage = StorageService();
  final notifier = NotificationService();
  var deadlines = <DeadlineModel>[].obs;

  @override
  void onInit() {
    load();
    notifier.init();
    super.onInit();
  }

  void load() async {
    deadlines.value = await storage.loadDeadlines();
  }

  void add(String title, DateTime time) {
    final dl = DeadlineModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      dateTime: time,
    );
    deadlines.add(dl);
    storage.saveDeadlines(deadlines);
    notifier.schedule(dl.id, title, time);
  }

  void delete(String id) {
    deadlines.removeWhere((e) => e.id == id);
    storage.saveDeadlines(deadlines);
  }
}
