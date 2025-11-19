import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TaskNote',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: appRoutes,

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
