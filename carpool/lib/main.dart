import 'package:carpool/screens/detail_event_screen.dart';
import 'package:carpool/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:carpool/screens/registration_screen.dart';
import 'package:carpool/screens/events_screen.dart';
import 'package:carpool/screens/create_screen.dart';
import 'package:carpool/screens/login_screen.dart';
import 'package:carpool/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Carpool());
}

class Carpool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login_screen',
      routes: {
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'events_screen': (context) => EventsScreen(),
//        'detail_event_screen': (context) => DetailEventScreen(eventID),
        'create_screen': (context) => CreateScreen(),
      },
    );
  }
}
