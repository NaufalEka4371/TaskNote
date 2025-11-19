import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tentang Aplikasi"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "TaskNote - Aplikasi Catatan & Pengingat",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "ini adalah aplikasi mobile sederhana tentang catatan dan pengingat tenggat tugas atau pengingat tanggal event penting lainnya. "
              "Aplikasi ini dibuat untuk memenuhi Ujian Tengah Semester "
              "Mata Kuliah Pemrograman Mobile 2.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Fitur yang tersedia:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("• Menulis catatan"),
            Text("• Menambahkan deadline/tenggat"),
            SizedBox(height: 20),
            Text("Copyright © 2025", style: TextStyle(fontSize: 14)),
            Text(
              "Dibuat oleh: Naufal Eka Putra Pratama - 23552011445",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
