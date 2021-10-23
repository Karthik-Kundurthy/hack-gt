import 'package:flutter/material.dart';
import 'package:carpool/screens/registration_screen.dart';
import 'package:carpool/screens/events_screen.dart';
import 'package:carpool/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
//  await Firebase.initializeApp();
  runApp(Carpool());
}

class Carpool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'registration_screen',
      routes: {
        'registration_screen': (context) => RegistrationScreen(),
        'events_screen': (context) => EventsScreen(),
      },
    );
  }
}
