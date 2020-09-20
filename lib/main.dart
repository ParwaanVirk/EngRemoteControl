import 'package:cogu/command_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'welcome_screen.dart';
import 'devices_screen.dart';
import 'command_screen.dart';
import 'testing_screen.dart';

void main() => runApp(COGU());

class COGU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
        accentColor: Colors.purple,
      ),
      home: DeviceScreen(),
      initialRoute: 'devices_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'devices_screen': (context) => DeviceScreen(),
        'command_screen': (context) => CommandScreen(),
        'testing_screen': (context) => TestingScreen(),
      },
    );
  }
}
