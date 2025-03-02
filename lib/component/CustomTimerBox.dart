import 'package:flutter/material.dart';
import 'package:pomodoro/contants/global.dart';


class CustomTimerBox extends StatelessWidget {
  final String time;  
  final String text;
  final EdgeInsets margin;


  const CustomTimerBox({super.key, required this.time , required this.margin , required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin:  margin,
         decoration: BoxDecoration(
                                color:  themeController.dialColor.value,
                                borderRadius: BorderRadius.circular(10)
                              ),
  
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(time , style: TextStyle(color: themeController.fontColor.value, fontSize: 64 , fontWeight: FontWeight.bold),),
               Text(text , style: TextStyle(color: themeController.fontColor.value , fontSize: 16 , fontWeight: FontWeight.w700),),
            ],
          ),
        ),
      ),
    );
  }
}
