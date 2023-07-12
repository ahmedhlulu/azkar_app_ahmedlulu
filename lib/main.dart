import 'package:azkar_app_ahmedlulu/screens/launch_screen.dart';
import 'package:azkar_app_ahmedlulu/screens/main_screen.dart';
import 'package:azkar_app_ahmedlulu/screens/out_boarding/out_boarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Mada'),
          labelLarge: TextStyle(
            fontFamily: 'Mada',
            fontWeight: FontWeight.w500,
            fontSize: 19,
          ),
        ),
      ),
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => LaunchScreen(),
        '/out_boarding_screen': (context) => OutBoardingScreen(),
        '/main_screen':(context) => MainScreen(),
      },
    );
  }
}
