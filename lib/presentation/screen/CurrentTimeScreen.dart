
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pomodoro/contants/global.dart';
import 'package:pomodoro/component/CustomTimerBox.dart';

class Currenttimescreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32 , vertical: 32 ),
            child: Column(
              children: [ 
                  CustomTimerBox(time: timeController.hour.value , text: "Hours"  , margin :  EdgeInsets.only( bottom : 10)) ,    
                  CustomTimerBox(time: timeController.minute.value , text: "Minutes" , margin : EdgeInsets.only( bottom : 10 ) ) , 
                  CustomTimerBox(time: timeController.second.value , text: "Second" , margin : EdgeInsets.only( bottom : 10 ) ) , 
              ],
            ),
          );
        }),
    );
  }
}