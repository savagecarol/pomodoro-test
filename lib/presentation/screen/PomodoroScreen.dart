import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro/component/CustomTimerBox.dart';
import 'package:pomodoro/contants/global.dart';



class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  
  @override
  void initState() {
    super.initState();
     getValue();
   
  }

  getValue() async{

    await pomodoroController.settingPomoDoro();
  }

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      return Container(
        child: (pomodoroController.isSetting.value == true) ? const Center(
          child: CircularProgressIndicator(),
        ) :Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTimerBox(time: pomodoroController.minute.value.toString() , text: "minutes", margin: const EdgeInsets.only(bottom: 10)),
                    CustomTimerBox(time: pomodoroController.seconds.value.toString().padLeft(2, '0') ,  text: "seconds" , margin: EdgeInsets.only(bottom: 10)),
                  ],
                ),
              ),
            ),
                 Positioned(top: 16 , right: 16, child:   Container(
                                  padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: themeController.iconColor.value
                                    )
                                  ),
                   child: Text("${pomodoroController.sessionCount.value}",
                   style: TextStyle(color: themeController.fontColor.value , fontSize: 24 , fontWeight: FontWeight.w600),),
                 )),


                (!(pomodoroController.isPomodoroRunning.value == false && pomodoroController.isPomodoroRunning.value == false)) ? 
                  Positioned(bottom:  sidebarController.isSidebarOpen.value == false ? 32 : 48 , right: 16, child:   Container(
                                  padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: themeController.iconColor.value
                                    )
                                  ),
                   child: Text( pomodoroController.isPomodoroRunning.value ? "FOCUS" :  pomodoroController.isBreakRunning.value ? "BREAK" : "" ,
                   style: TextStyle(color: themeController.fontColor.value , fontSize: 24 , fontWeight: FontWeight.w600),),
                 )) : Container(),

          ],
        ),
      );
    });
  }

}