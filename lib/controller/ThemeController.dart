import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  
  var backgroundColor = Colors.grey.obs;
  var fontColor =  MaterialColor(
    0xFFFFFFFF, // Primary white color as the base
    <int, Color>{
      50: Color(0xFFFFFFFF),  // Lightest shade (white)
      100: Color(0xFFFFFFFF), // White, you can adjust shades if you want
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


  var dialColor = MaterialColor(0xFF000000, {
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


  var iconColor = MaterialColor(
    0xFFFFFFFF, // Primary white color as the base
    <int, Color>{
      50: Color(0xFFFFFFFF),  // Lightest shade (white)
      100: Color(0xFFFFFFFF), // White, you can adjust shades if you want
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
  
  final MaterialColor defaultBackgroundColor = Colors.grey;
  final MaterialColor defaultFontColor = MaterialColor(
    0xFFFFFFFF, 
    <int, Color>{
      50: Color(0xFFFFFFFF),  
      100: Color(0xFFFFFFFF), 
      200: Color(0xFFFFFFFF), 
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF), 
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  final MaterialColor defaultDialColor = MaterialColor(0xFF000000, {
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


  final MaterialColor defaultIconColor = MaterialColor(
    0xFFFFFFFF, // Primary white color as the base
    <int, Color>{
      50: Color(0xFFFFFFFF),  // Lightest shade (white)
      100: Color(0xFFFFFFFF), // White, you can adjust shades if you want
      200: Color(0xFFFFFFFF), 
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF), // Base white
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );


  void resetToDefault() {
    backgroundColor.value = defaultBackgroundColor;
    fontColor.value = defaultFontColor;
    dialColor.value = defaultDialColor;
    iconColor.value = defaultIconColor;
  }

  void changeColor(String colorType, MaterialColor color) {
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
  }
}
