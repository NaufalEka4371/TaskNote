import 'package:get/get.dart';

class AuthController extends GetxController {
  bool login(String email, String pass) {
    return email.isNotEmpty && pass.isNotEmpty;
  }
}
