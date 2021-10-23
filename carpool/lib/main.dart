import 'package:flutter/material.dart';
import 'package:carpool/screens/registration_screen.dart';

void main() => runApp(Carpool());

class Carpool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'registration_screen',
      routes: {
        'registration_screen': (context) => RegistrationScreen(),
      },
    );
  }
}
