import 'package:get/get.dart';
import 'dart:async';

class Currenttimercontroller extends GetxController {
  var hour =  DateTime.now().hour.toString().obs;
  var minute = DateTime.now().minute.toString().obs;
  var second = DateTime.now().second.toString().obs;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(Duration(seconds: 1), (_) {
      updateCurrentTime();
    });
  }
  void updateCurrentTime() {
    final now = DateTime.now();
    hour.value = now.hour.toString().length == 1 ? "0${now.hour}" : now.hour.toString() ;
    minute.value = now.minute.toString().length == 1 ? "0${now.minute}"   : now.minute.toString() ;
    second.value = now.second.toString().length == 1 ? "0${now.second}"   : now.second.toString() ;
  }
}
