import 'package:flutter/material.dart';
import 'package:sewerappp/home_screen.dart';
import 'package:sewerappp/rounded_button.dart';
import 'components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:catcher/catcher_plugin.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
  String email="";
  String password="";
  String name="";
  String contact="";
  String verificationId;
String cpassword="";
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("images/wall.jpg"), fit: BoxFit.cover)),


      child: Scaffold(
        backgroundColor: Colors.transparent,
       // backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall:showSpinner,
          child: Padding(
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
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    name=value;
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
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState((){this.contact=value;});
                    //Do something with the user input.
                  },
                  decoration: kTextFileDecoration.copyWith(hintText: 'Enter your contact'),
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
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email=value;
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
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState((){password=value;});
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
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
              cpassword=value;
                    //Do something with the user input.
                  },
                  decoration:  kTextFileDecoration.copyWith(hintText:'Confirm your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(title: 'Register',colour: Colors.black,onPressed:() async{
//                print(email);
//                print(password);
//                print(name);
//                print(contact);
    setState(() {

    showSpinner=true;
    });

    try {
    final newUser = await _auth.createUserWithEmailAndPassword(
    email:email, password:password).then((signedInUser){

    });
    //byy using async and await will be sure that the user is created and authenticated as a future value is obtained
    if(newUser!=null)
    {
    Navigator.pushNamed(context,HomeScreen.id);
    }
    setState((){
    showSpinner=false;
    });
    }
                catch(e){
                print(e);
                }
                } ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
