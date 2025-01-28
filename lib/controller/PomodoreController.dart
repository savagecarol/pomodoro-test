import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart';

class PomodoroController extends GetxController {
  var minute = 25.obs;  
  var seconds = 0.obs;  
  var sessionCount = 0.obs;  
  var isPomodoroRunning = false.obs;  
  var isBreakRunning = false.obs;  
  var isSetting = false.obs;
  var is25 = false.obs;
  Timer? pomodoroTimer;

  final player = AudioPlayer();

  changeTime() async {
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    if(is25.value){
      is25.value  = false;
      prefs.setInt("pomodoroTime" , 50);
    }
    else{
      is25.value  = true;
      prefs.setInt("pomodoroTime" , 25);
    }
    stopTimer();
  }

  settingPomoDoro() async{
    isSetting.value = true;
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    int value = prefs.getInt("pomodoroTime")?? 25;
      if(value == 25) {
          minute.value = 25;
          is25.value = true;
    }
    else{
        minute.value = 50;
        is25.value = false;
    }
    seconds.value = 0;
    isSetting.value = false;
  }

  void startPomodoro() async {
    isPomodoroRunning.value = true;
    isBreakRunning.value = false;
    await settingPomoDoro();
    startTimer();
  }

  void startBreak() async{
    isBreakRunning.value = true;
     final SharedPreferences prefs =  await SharedPreferences.getInstance();
     int value = prefs.getInt("pomodoroTime")?? 25;
      if(value == 25) {
          minute.value = 5;
      }
      else{
        minute.value = 10;
      }
    seconds.value = 0;
    startTimer();
  }

  void startTimer() {
    pomodoroTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      playBeep();
      if (seconds.value > 0) {
        seconds.value--;  
      } else if (minute.value > 0) {
        minute.value--;  
        seconds.value = 59;  
      } else {
        timer.cancel();
        if (isPomodoroRunning.value) {
          sessionCount.value++;
          startBreak();
          playBeep();
        } else if (isBreakRunning.value) {
          startPomodoro();
          playBeep();
        }
      }
    });
  }



void playBeep() async {
  await player.setAsset('assets/beep.wav');
  player.play();
}



  void stopTimer() {
    pomodoroTimer?.cancel(); 
    if(is25.value) {
      minute.value = 25;
    } else {
      minute.value = 50;
    }
    seconds.value = 0; 
    sessionCount.value = 0;  
    isPomodoroRunning.value = false; 
    isBreakRunning.value = false;  
  }
}

