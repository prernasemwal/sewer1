import 'package:flutter/material.dart';
import 'package:sewerappp/rounded_button.dart';
import 'components.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("images/wall.jpg"), fit: BoxFit.cover)),


      child: Scaffold(
        backgroundColor: Colors.transparent,
       // backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
             // Container(
               // height: 200.0,
               // child: Image.asset('images/logo.png'),
              //),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: kTextFileDecoration.copyWith(hintText: 'Enter your first name'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Contact Details',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: kTextFileDecoration.copyWith(hintText: 'Enter your last name'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Email Address',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: kTextFileDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: kTextFileDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration:  kTextFileDecoration.copyWith(hintText:'Confirm your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(title: 'Register',colour: Colors.black,onPressed:(){} ),
            ],
          ),
        ),
      ),
    );
  }
}
