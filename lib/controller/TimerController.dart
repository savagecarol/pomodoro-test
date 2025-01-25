import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  var hour = 0.obs;  
  var minute = 0.obs; 
  var seconds = 0.obs;  
  var state = 0.obs;

  late Timer _timer;

  void startTimer() {
    state.value = 1;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        incrementTime(); 
    });
  }

    void pauseTimer() {
    if (state.value == 1) {
      state.value = 2; 
      _timer.cancel();  
    }
  }

   void stopTimer() {
    state.value = 0;  
    _timer.cancel();  
    resetTime();  
  }

  void resetTime() {
    hour.value = 0;
    minute.value = 0;
    seconds.value = 0;
  }

  void incrementTime() {
    if (seconds.value < 59) {
      seconds.value++;
    } else if (minute.value < 59) {
      seconds.value = 0;
      minute.value++;
    } else {
      seconds.value = 0;
      minute.value = 0;
      hour.value++;
    }
  }

}
