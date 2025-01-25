import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro/component/CustomTimerBox.dart';
import 'package:pomodoro/contants/global.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            children: [
              CustomTimerBox(
                time: timerController.hour.value.toString().padLeft(2, '0'),  
                text: "hours",
                margin: EdgeInsets.only(bottom: 10),
              ),
              CustomTimerBox(
                text: "minutes",
                time: timerController.minute.value.toString().padLeft(2, '0'), 
                margin: EdgeInsets.only(bottom: 10),
              ),
              CustomTimerBox(
                text: "seconds",
                time: timerController.seconds.value.toString().padLeft(2, '0'), 
                margin: EdgeInsets.only(bottom: 10),
              ),
            ],
          ),
        );
      }),
    );
  }
}
