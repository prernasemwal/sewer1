import 'package:flutter/material.dart';
import 'package:sewerappp/rounded_button.dart';
import 'components.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:catcher/catcher_plugin.dart';

class LoginScreen extends StatefulWidget {
  static const String id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  bool showSpinner=false;
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
        body: ModalProgressHUD(
          inAsyncCall:showSpinner,
          child: Padding(
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
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    _email=value;
                    //Do something with the user input.
                  },
                  decoration: kTextFileDecoration.copyWith(hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    _password=value;
                    //Do something with the user input.
                  },
                  decoration: kTextFileDecoration.copyWith(hintText:'Enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(title:'Log In',colour: Colors.black54
                  ,onPressed:()async {
                      setState(() {
                        showSpinner=true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        if (user != null) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      }
                      catch(e){
                        print(e);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
