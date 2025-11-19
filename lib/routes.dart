import 'package:get/get.dart';
import 'pages/splash_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';

final appRoutes = [
  GetPage(name: '/splash', page: () => const SplashPage()),
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/register', page: () => const RegisterPage()),
  GetPage(name: '/home', page: () => const HomePage()),
];
