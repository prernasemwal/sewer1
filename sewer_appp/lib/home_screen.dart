import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components.dart';
import 'rounded_button.dart';
import 'package:sewerappp/maped_screen.dart';


class HomeScreen extends StatefulWidget {

  static const String id='home_screen';
//  final GoogleMapOverlayController controller;
//
//  const MapUiBody(this.controller, GoogleMapController mapController);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result="";
  String check="";
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  void getCurrentUser() async{
    try{final user= await _auth .currentUser();
    if(user!=null)
    {loggedInUser=user;
    print(loggedInUser.email);
    }
    }
    catch(e){
      print(e);
    }
  }
  void initState() {
    super.initState();
    getCurrentUser();

    super.initState();
  }
  //allows us to control the text in the text field
  final TextEditingController controller = new TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/finalwater.png"), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: AppBar(

            centerTitle: true,
            title: Text('Swasthya'),
            actions: <Widget>[
            ],
            backgroundColor: Colors.black,
            elevation: 50.0,
            brightness: Brightness.dark,
          ),
        ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              accountName: Text("prerna semwal"),
              accountEmail: Text(loggedInUser.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                Theme.of(context).platform == TargetPlatform.iOS ? Colors.black : Colors.white,
                child: Text(
                    "P",
                    //have to add here the first alphabet of the account name
                    style: TextStyle(fontSize: 40.0,
                      color: Colors.black,)
                ),
              ),
        ),
        ListTile(
              title: Text('Home', style: TextStyle(fontSize: 15.0,
                color: Colors.black,),),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('maped', style: TextStyle(fontSize: 15.0,
                color: Colors.black,),),
              onTap: () {
                Navigator.pushNamed(context,MapedScreen.id);
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Log out', style: TextStyle(fontSize: 15.0,
                color: Colors.black,),),
              onTap: () {
                _auth.signOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        result=value;

                      }
                      );
                    },
                    //Do something with the user input.
                    // controller.text="";
                    controller: controller,
//                  check=controller.text,
                    decoration:  kTextFileDecoration.copyWith(hintText:'Search here'),
                  ),

                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(title:'Search',colour: Colors.black87,onPressed:() {
                if(controller.text=="kashmiri gate")
                {
                  Navigator.pushNamed(context,HomeScreen.id);
                }
              }, ),
            ],
          ),
        ),
      ),
    );
  }
}