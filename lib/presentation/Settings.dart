import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:pomodoro/contants/global.dart';
import 'package:pomodoro/controller/ThemeController.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  void _openColorPicker(BuildContext context, String colorType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick $colorType Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: colorType == 'Background'
                  ? themeController.backgroundColor.value
                  : colorType == 'font'
                      ? themeController.fontColor.value
                      : colorType == 'Dial'
                          ? themeController.dialColor.value
                          : themeController.iconColor.value,
              onColorChanged: (color) {
                MaterialColor materialColor = MaterialColor(
                  color.value,
                  {
                    50: color.withOpacity(0.1),
                    100: color.withOpacity(0.2),
                    200: color.withOpacity(0.3),
                    300: color.withOpacity(0.4),
                    400: color.withOpacity(0.5),
                    500: color.withOpacity(0.6),
                    600: color.withOpacity(0.7),
                    700: color.withOpacity(0.8),
                    800: color.withOpacity(0.9),
                    900: color.withOpacity(1.0),
                  },
                );

                themeController.changeColor(colorType, materialColor);
              },
              showLabel: true,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return    Obx(() { 
      return Scaffold(
      backgroundColor: themeController.backgroundColor.value,
      appBar: AppBar(
        backgroundColor: themeController.backgroundColor.value,
        iconTheme:  IconThemeData(
          color:  themeController.iconColor.value,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PomoDoro Timing",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color:themeController.fontColor.value,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      "25 min / 5 min",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: themeController.fontColor.value,
                      ),
                    ),
            
                    Switch(
                        value: pomodoroController.is25.value,
                        onChanged: (bool value) async {
                          await pomodoroController.changeTime();
                        },
                        activeColor: themeController.fontColor.value,  
                        inactiveThumbColor: themeController.iconColor.value, 
                        inactiveTrackColor: themeController.dialColor.value,
                      )
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "50 min / 10 min",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: themeController.fontColor.value,
                      ),
                    ),
                 Switch(
                        value: !pomodoroController.is25.value,
                        onChanged: (bool value) async {
                          await pomodoroController.changeTime();
                        },
                        activeColor: themeController.fontColor.value,  
                        inactiveThumbColor: themeController.iconColor.value, 
                        inactiveTrackColor: themeController.dialColor.value,
                      )
                  ],
                ),
              ),
              SizedBox(height: 32),
               Text(
                "App Theme",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color:themeController.fontColor.value,
                ),
              ),

              // Color Pickers
              Container(
                child: Column(
                  children: [
                    // Background Color Picker
                    ListTile(
                      title:  Text(
                        "Background Color",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: themeController.fontColor.value,
                        ),
                      ),
                      trailing: Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 4, // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20, 
                            backgroundColor: themeController.backgroundColor.value,
                          ),
                        );
                      }),
                      onTap: () => _openColorPicker(context, 'Background'),
                    ),
                    ListTile(
                      title:  Text(
                        "font Color",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: themeController.fontColor.value,
                        ),
                      ),
                      trailing: Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 4, // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20, 
                            backgroundColor: themeController.fontColor.value,
                          ),
                        );
                      }),
                      onTap: () => _openColorPicker(context, 'font'),
                    ),
                    // Dial Color Picker
                    ListTile(
                      title:  Text(
                        "Dial Color",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: themeController.fontColor.value,
                        ),
                      ),
                      trailing: Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 4, // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20, // You can adjust the radius as needed
                            backgroundColor: themeController.dialColor.value,
                          ),
                        );
                      }),
                      onTap: () => _openColorPicker(context, 'Dial'),
                    ),
                    ListTile(
                      title:  Text(
                        "Icon Color",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: themeController.fontColor.value,
                        ),
                      ),
                      trailing: Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 4, // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20, // You can adjust the radius as needed
                            backgroundColor: themeController.iconColor.value,
                          ),
                        );
                      }),
                      onTap: () => _openColorPicker(context, 'Icon'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                       style: ElevatedButton.styleFrom(
                          backgroundColor: themeController.dialColor.value,
                      ),
                      onPressed: themeController.resetToDefault,
                      child: Text(
                        "Reset To Default",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: themeController.fontColor.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );});
  }
}
