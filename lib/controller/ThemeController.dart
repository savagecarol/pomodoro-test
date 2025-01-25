import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {

  var isColorLoading = false.obs;

  var backgroundColor = const MaterialColor(
    0xFF808080, // grey color in hex
    <int, Color>{
      50: Color(0xFFB0B0B0),  // Lightest shade of grey
      100: Color(0xFF999999),  // Lighter grey
      200: Color(0xFF808080),  // Base grey
      300: Color(0xFF666666),  // Darker grey
      400: Color(0xFF555555),
      500: Color(0xFF444444),  // Dark grey
      600: Color(0xFF333333),
      700: Color(0xFF222222),
      800: Color(0xFF111111),
      900: Color(0xFF000000),  // Darkest grey (almost black)
    },
  ).obs;

  var fontColor = const MaterialColor(
    0xFFFFFFFF, // Primary white color as the base
    <int, Color>{
      50: Color(0xFFFFFFFF),  // Lightest shade (white)
      100: Color(0xFFFFFFFF), // White
      200: Color(0xFFFFFFFF), 
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF), // Base white
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  ).obs;

  var dialColor = const MaterialColor(0xFF000000, {
    50: Colors.black,   
    100: Colors.black,
    200: Colors.black,
    300: Colors.black,
    400: Colors.black,
    500: Colors.black,  
    600: Colors.black,
    700: Colors.black,
    800: Colors.black,
    900: Colors.black,  
  }).obs;

  var iconColor = const MaterialColor(
    0xFFFFFFFF, // Primary white color as the base
    <int, Color>{
      50: const Color(0xFFFFFFFF),  // Lightest shade (white)
      100: const Color(0xFFFFFFFF), // White
      200: const Color(0xFFFFFFFF), 
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF), // Base white
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  ).obs;

  final MaterialColor defaultBackgroundColor = const MaterialColor(
    0xFF808080, // grey color in hex
    <int, Color>{
      50: const Color(0xFFB0B0B0),  // Lightest shade of grey
      100: const Color(0xFF999999),  // Lighter grey
      200: const Color(0xFF808080),  // Base grey
      300: const Color(0xFF666666),  // Darker grey
      400: const Color(0xFF555555),
      500: const Color(0xFF444444),  // Dark grey
      600: const Color(0xFF333333),
      700: const Color(0xFF222222),
      800: const Color(0xFF111111),
      900: const Color(0xFF000000),  // Darkest grey (almost black)
    },
  );

  final MaterialColor defaultFontColor = const MaterialColor(
    0xFFFFFFFF, 
    <int, Color>{
      50: const Color(0xFFFFFFFF),  
      100: const Color(0xFFFFFFFF), 
      200: const Color(0xFFFFFFFF), 
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF), 
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  final MaterialColor defaultDialColor = const MaterialColor(0xFF000000, {
    50: Colors.black,   
    100: Colors.black,
    200: Colors.black,
    300: Colors.black,
    400: Colors.black,
    500: Colors.black,  
    600: Colors.black,
    700: Colors.black,
    800: Colors.black,
    900: Colors.black,  
  });

  final MaterialColor defaultIconColor = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: const Color(0xFFFFFFFF),  
      100: const Color(0xFFFFFFFF), 
      200: const Color(0xFFFFFFFF), 
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF), 
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  void resetToDefault() {
    backgroundColor.value = defaultBackgroundColor;
    fontColor.value = defaultFontColor;
    dialColor.value = defaultDialColor;
    iconColor.value = defaultIconColor;
  }

  void changeColor(String colorType, MaterialColor color) async {
    switch (colorType) {
      case 'Background':
        backgroundColor.value = color;
        break;
      case 'font':
        fontColor.value = color;
        break;
      case 'Dial':
        dialColor.value = color;
        break;
      case 'Icon':
        iconColor.value = color;
        break;
      default:
        break;
    }
    await storeColor();
  }

  Future<void> storeColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('backgroundColor', backgroundColor.value[500]?.value ?? 0xFF808080);
    prefs.setInt('fontColor', fontColor.value[500]?.value ?? 0xFFFFFFFF);
    prefs.setInt('dialColor', dialColor.value[500]?.value ?? 0xFF000000);
    prefs.setInt('iconColor', iconColor.value[500]?.value ?? 0xFFFFFFFF);
  }

Future<void> getColor() async {

  isColorLoading.value = true;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? bgColorValue = prefs.getInt('backgroundColor');
  int? fontColorValue = prefs.getInt('fontColor');
  int? dialColorValue = prefs.getInt('dialColor');
  int? iconColorValue = prefs.getInt('iconColor');



  backgroundColor.value = bgColorValue != null ? MaterialColor(bgColorValue, {50: Color(bgColorValue)})  : defaultBackgroundColor;
  fontColor.value = fontColorValue != null  ? MaterialColor(fontColorValue, {50: Color(fontColorValue)})   : defaultFontColor;
  dialColor.value = dialColorValue != null   ? MaterialColor(dialColorValue, {50: Color(dialColorValue)})  : defaultDialColor; 
  iconColor.value = iconColorValue != null  ? MaterialColor(iconColorValue, {50: Color(iconColorValue)})   : defaultIconColor;
  isColorLoading.value = false;
}
}