import 'package:flutter/material.dart';
import 'package:carpool/screens/login_screen.dart';

void main() => runApp(Carpool());

class Carpool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login_screen',
      routes: {
        'login_screen': (context) => LoginScreen(),
      },
    );
  }
}
