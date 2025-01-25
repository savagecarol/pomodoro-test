import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final double size;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color backgroundColour;
  final bool isActive;
  final Function() onTap;

  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
    required this.iconColor,
    required this.backgroundColour,
    this.size = 32,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.all(8),
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
                      return   InkWell(
                                  onTap: onTap,
                                child: Container(
                                padding: padding,
                                margin:margin,
                                decoration: BoxDecoration(
                                  color: isActive == true ? backgroundColour : Colors.transparent,
                                   border:  Border.all(
                                    color: isActive == false ? backgroundColour : Colors.transparent
                                   ),
                                   
                                   
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(iconData ,   color: iconColor,  size: size),));
                              
  }
}

