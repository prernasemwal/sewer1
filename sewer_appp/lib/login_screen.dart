import 'package:flutter/material.dart';
import 'package:sewerappp/rounded_button.dart';
import 'components.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {

  static const String id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
//          image: DecorationImage(
//              image: AssetImage("images/inside.png"), fit: BoxFit.cover)
             ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 150.0,
                    child: Image.asset('images/manholecoverb.png'),
                    width: 150.0,
                  ),
                  Text(
                    'Swatchta',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: kTextFileDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: kTextFileDecoration.copyWith(hintText:'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(title:'Log In',colour: Colors.black54
                ,onPressed:(){
                  Navigator.pushNamed(context, HomeScreen.id);
                }, ),
            ],
          ),
        ),
      ),
    );
  }
}
