import 'package:get/get.dart';

class Screenmanagementcontroller extends GetxController {
  final currentSecreen = 0.obs;

  void updateScreen(int value) {
    currentSecreen.value = value;

  }
}
