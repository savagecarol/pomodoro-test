import 'package:flutter/material.dart';
import 'package:pomodoro/contants/global.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color fontColor;
  final FontWeight fontWeight;
  final double size;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color backgroundColour;
  final bool isActive;
  final Function() onTap;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.fontColor = Colors.white,
    this.fontWeight = FontWeight.w600,
    required this.backgroundColour,
    this.size = 18,
    this.padding = const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
    this.margin = const EdgeInsets.all(8),
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
                      return   GestureDetector(
                                  onTap: onTap,
                                child: Container(
                                padding: padding,
                                margin:margin,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:  themeController.dialColor.value,  
                                ),
                                child: Text(text, style: TextStyle( color: fontColor, fontWeight: fontWeight, fontSize: size ))));
                              
  }
}

