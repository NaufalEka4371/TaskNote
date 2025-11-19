import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);

    tz.initializeTimeZones();

    await plugin.initialize(settings);
  }

  Future<void> schedule(String id, String title, DateTime time) async {
    final tzTime = tz.TZDateTime.from(time, tz.local);

    await plugin.zonedSchedule(
      int.parse(id),
      "Deadline Reminder",
      title,
      tzTime,
      const NotificationDetails(
        android: AndroidNotificationDetails('deadline_channel', 'Deadlines'),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }
}
