import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(DeliveryApp());
}

class DeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kvikk Delivery Partner',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.yellow[700],
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.yellow[700],
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[700]!),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[700]!),
            borderRadius: BorderRadius.circular(8),
          ),
          labelStyle: TextStyle(color: Colors.yellow[700]),
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
