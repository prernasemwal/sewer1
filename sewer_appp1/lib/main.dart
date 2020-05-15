import 'package:flutter/material.dart';
import 'package:sewerappp/screens/home_screen.dart';
import 'package:sewerappp/authentication/login_screen.dart';
import 'package:sewerappp/screens//welcome_screen.dart';
import 'package:sewerappp/authentication/registration_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

void main()
{
  runApp(Sewer());
}

class Sewer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute:WelcomeScreen.id,
      //if you have initial screen then you cannot have home
      routes: {
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        HomeScreen.id:(context)=>HomeScreen(),
      },
    );
  }
}
