import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo_x/Providers/menu_provider.dart';
import 'package:todo_x/Services/api_services.dart';
import 'package:todo_x/Views/home_screen.dart';
import 'package:todo_x/Views/menu_screen.dart';
import 'package:todo_x/constants.dart';

void main() {
  runApp(const Wrapper());
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final ApiService _apiService = ApiService();
  bool _isLoading = true;
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _height = Get.height;
    final double _widht = Get.width;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MenuStateProvider>(
            create: (context) => MenuStateProvider(),
          )
        ],
        builder: (context, child) {
          return Consumer<MenuStateProvider>(
            builder: (context, menuStateProvider, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: SafeArea(
                child: SizedBox(
                  height: _height,
                  width: _widht,
                  child: Scaffold(
                    floatingActionButton:
                        menuStateProvider.menuState || _isLoading
                            ? null
                            : FloatingActionButton(
                                elevation: 8.0,
                                onPressed: () async {
                                  _apiService.getMembers(id: "1");
                                },
                                backgroundColor: kSecondaryColor,
                                child: const Icon(
                                  Icons.add,
                                  color: kIconColor,
                                ),
                              ),
                    backgroundColor: kPrimaryColor,
                    body: Stack(
                      children: [
                        const Menu(),
                        const Home(),
                        if (_isLoading)
                          Container(
                            color: Colors.white,
                            height: _height,
                            width: _widht,
                            child: CustomPaint(
                              painter: BackgroundPainter(),
                              child: SizedBox(
                                height: _height,
                                width: _widht,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "TODO - X",
                                        style: TextStyle(
                                            fontSize: 56.0,
                                            color: kPrimaryColor),
                                      ),
                                      Text(
                                        "Task Management Application",
                                        style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 80,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint blueBrush = Paint()..color = kPrimaryColor;
    Paint yellowBrush = Paint()..color = kYellowColor;
    Paint lightPinkBrush = Paint()..color = kLightPink;
    Paint lightBlueBrush = Paint()..color = kPrimaryColor.withOpacity(0.3);
    Paint orageBrush = Paint()..color = kPrimaryColor.withOpacity(0.8);
    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCenter(center: Offset(50, 30), width: 80, height: 250),
            150.0,
            150.0),
        blueBrush);
    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCenter(
                center: Offset(Get.width * 0.6, -20), width: 80, height: 250),
            150.0,
            150.0),
        yellowBrush);
    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCenter(center: Offset(100, 40), width: 80, height: 350),
            150.0,
            150.0),
        lightBlueBrush);
    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCenter(
                center: Offset(Get.width, Get.height * 0.3),
                width: 80,
                height: 250),
            150.0,
            150.0),
        lightPinkBrush);
    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCenter(
                center: Offset(50, Get.height * 0.7), width: 80, height: 250),
            150.0,
            150.0),
        blueBrush);
    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCenter(
                center: Offset(100, Get.height * 0.75),
                width: 80,
                height: Get.height * 0.3),
            150.0,
            150.0),
        lightBlueBrush);
    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCenter(
                center: Offset(Get.width * 0.6, Get.height * 0.65),
                width: 80,
                height: 250),
            150.0,
            150.0),
        yellowBrush);
    canvas.drawRRect(
        RRect.fromRectXY(
            Rect.fromCenter(
                center: Offset(Get.width, Get.height * 0.9),
                width: 80,
                height: 250),
            150.0,
            150.0),
        lightPinkBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw true;
  }
}
