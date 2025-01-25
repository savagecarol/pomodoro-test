import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro/component/CustomIconButton.dart';
import 'package:pomodoro/component/CustomTextButton.dart';
import 'package:pomodoro/contants/global.dart';
import 'package:pomodoro/presentation/Settings.dart';
import 'package:pomodoro/presentation/screen/CurrentTimeScreen.dart';
import 'package:pomodoro/presentation/screen/PomodoroScreen.dart';
import 'package:pomodoro/presentation/screen/TimerScreen.dart';

Widget _HomePageViwer(int currentScreen) {
    switch (currentScreen) {
      case 0:
        return Currenttimescreen();
      case 1:
        return PomodoroScreen();
      case 2:
        return TimerScreen();
      default:
        return Currenttimescreen(); 
    }
}

Widget bottomBuilder(BuildContext context){
                           if( screenmanagementcontroller.currentSecreen.value == 0)
                           {
                              return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [                      
                                CustomIconButton(iconData: Icons.settings , onTap: () {
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Settings()),
                                        );
                                    }, iconColor: themeController.iconColor.value, backgroundColour: themeController.backgroundColor.value)
                              ],
                            );
                           }
                          else if( screenmanagementcontroller.currentSecreen.value == 2)
                          {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [                      
                                Row(children: [
                                    if(timerController.state.value == 0) 
                                    CustomTextButton(text : "Start" , onTap: () {timerController.startTimer();}, fontColor: themeController.fontColor.value, backgroundColour: themeController.dialColor.value),
                                    if(timerController.state.value ==1)
                                    Row(
                                      children: [
                                        CustomTextButton(text: "pause" , onTap: () {timerController.pauseTimer();}, fontColor: themeController.fontColor.value, backgroundColour:  themeController.dialColor.value),
                                        CustomTextButton(text : "Stop", onTap: () {timerController.stopTimer();}, fontColor: themeController.fontColor.value, backgroundColour:  themeController.dialColor.value),
                                      ],
                                    ),
                                    if(timerController.state.value ==2)
                                    Row(
                                      children: [
                                        CustomTextButton(text: "resume" , onTap: () {timerController.startTimer();}, fontColor: themeController.fontColor.value, backgroundColour:  themeController.dialColor.value),
                                        CustomTextButton(text : "Stop", onTap: () {timerController.stopTimer();}, fontColor: themeController.fontColor.value, backgroundColour:  themeController.dialColor.value),
                                      ],
                                    ),
                                ],),   
                                CustomIconButton(iconData: Icons.settings , onTap: () {
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Settings()),
                                        );
                                    }, iconColor: themeController.iconColor.value, backgroundColour: themeController.backgroundColor.value)
                              ],
                            );
                          }

                        return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [                      
                                Container(
                                  child: Row(children: [
                                    (pomodoroController.isPomodoroRunning.value == false && pomodoroController.isBreakRunning.value == false )  ?
                                      CustomTextButton(text : "Start" , onTap: () {pomodoroController.startPomodoro();}, fontColor: themeController.fontColor.value, backgroundColour:  themeController.dialColor.value)
                                      :
                                      CustomTextButton(text : "Stop", onTap: () {pomodoroController.stopTimer();}, fontColor: themeController.fontColor.value, backgroundColour:  themeController.dialColor.value),
                        
                                  ],)     
                                ),   
                                CustomIconButton(iconData: Icons.settings , onTap: () {
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Settings()),
                                        );
                                    }, iconColor: themeController.iconColor.value, backgroundColour:  themeController.dialColor.value)
                              ],
                            );                                                      
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() { 
      return Scaffold(
      backgroundColor:  themeController.backgroundColor.value.shade800,
      body: GestureDetector(
        onTap: () {
          sidebarController.toggleSidebar();
        },
        child:  Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInExpo,
                margin: EdgeInsets.only(
                  left: sidebarController.isSidebarOpen.value ? 32 : 0, 
                  bottom: sidebarController.isSidebarOpen.value ? 32 : 0
                ),
                child: _HomePageViwer(screenmanagementcontroller.currentSecreen.value),
              ),
                            sidebarController.isSidebarOpen.value
                  ? AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 64,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                                  CustomIconButton(iconData: Icons.access_time_outlined , onTap: () {
                                    screenmanagementcontroller.updateScreen(0);
                                  } , iconColor: themeController.iconColor.value, backgroundColour: themeController.backgroundColor.value , margin: EdgeInsets.symmetric(vertical: 8),
                                  isActive: screenmanagementcontroller.currentSecreen == 0 ? true : false ,),          
                                  CustomIconButton(iconData: Icons.hourglass_bottom , onTap: () {
                                       screenmanagementcontroller.updateScreen(1);
                                  }, iconColor:  themeController.iconColor.value, backgroundColour: themeController.backgroundColor.value , margin: EdgeInsets.symmetric(vertical: 8),
                                   isActive: screenmanagementcontroller.currentSecreen == 1 ? true : false ),
                                  CustomIconButton(iconData: Icons.timer , onTap: () {
                                       screenmanagementcontroller.updateScreen(2);
                                  }, iconColor:  themeController.iconColor.value, backgroundColour: themeController.backgroundColor.value , margin: EdgeInsets.symmetric(vertical: 8),
                                   isActive: screenmanagementcontroller.currentSecreen == 2 ? true : false ),
                          ],
                        ),
                      ),
                    )
                  : Container(), 
                   sidebarController.isSidebarOpen.value
                  ? AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: bottomBuilder(context)                
                      ),
                    )
                  : Container(),
            ],
          )
        )
      );
        }
      );
    }
}
