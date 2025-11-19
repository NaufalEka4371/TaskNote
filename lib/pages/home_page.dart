import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'notes_page.dart';
import 'deadline_page.dart';
import 'about_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = [NotesPage(), DeadlinePage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TaskNote"),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              if (Get.isDarkMode) {
                Get.changeTheme(ThemeData.light());
              } else {
                Get.changeTheme(ThemeData.dark());
              }
            },
          ),
        ],
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Catatan"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Pengingat"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
      ),
    );
  }
}
