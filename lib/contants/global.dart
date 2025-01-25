import 'package:get/get.dart';
import 'package:pomodoro/controller/CurrentTimerController.dart';
import 'package:pomodoro/controller/PomodoreController.dart';
import 'package:pomodoro/controller/ScreenManagementController.dart';
import 'package:pomodoro/controller/SideBarController.dart';
import 'package:pomodoro/controller/ThemeController.dart';
import 'package:pomodoro/controller/TimerController.dart';
   

final Currenttimercontroller timeController = Get.put(Currenttimercontroller());
final Screenmanagementcontroller screenmanagementcontroller = Get.put(Screenmanagementcontroller());
final SidebarController sidebarController = Get.put(SidebarController());
final PomodoroController pomodoroController = Get.put(PomodoroController());
final ThemeController themeController = Get.put(ThemeController());
final TimerController timerController = Get.put(TimerController());
