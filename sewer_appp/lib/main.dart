import 'package:flutter/material.dart';
import 'package:sewerappp/home_screen.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';
import 'registration_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

void main() {
//  GoogleMapController.init();
//  final size = MediaQueryData.fromWindow(ui.window).size;
//  final GoogleMapOverlayController controller =
//  GoogleMapOverlayController.fromSize(
//    width: size.width,
//    height: size.height - 72.0,
//  );
//  final mapController = controller.mapController;
//  final Widget mapWidget = GoogleMapOverlay(controller: controller);
  runApp(Sewer());}

class Sewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //theme: ThemeData.dark().copyWith(
      //textTheme: TextTheme(
      //body1: TextStyle(color: Colors.black54),
      //),
      //),
      //here we have deleted this theme as the text is coming white
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
