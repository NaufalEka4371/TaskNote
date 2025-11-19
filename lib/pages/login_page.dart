import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());

    final email = TextEditingController();
    final pass = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (auth.login(email.text, pass.text)) {
                  Get.offNamed('/home');
                }
              },
              child: const Text("Masuk"),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/register'),
              child: const Text("Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
