import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sewerappp/welcome_screen.dart';
import 'components.dart';
import 'rounded_button.dart';
import 'package:sewerappp/maped_screen.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {

  static const String id='home_screen';
//  final GoogleMapOverlayController controller;
//
//  const MapUiBody(this.controller, GoogleMapController mapController);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firestore = Firestore.instance;
//  crudMethods crudObj=new crudMethods();
 // String result="";
  String check="";
  String place;
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
  }//in cases where the data is not changing again and again
//  void getArea()async{
//   final area = await _firestore.collection('area').getDocuments();
//   for(var area in area.documents){
//     print(area.data);
//   }
//  }
  //to listen to the stream of messages like in case of chatting
//  void messageStream() async {
//   await for(var snapshot in  _firestore.collection('latlong').snapshots())
//     {for(var lat in snapshot.documents){
//     print(lat.data);
//   }
//     }
//  }

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
//        color:Colors.grey,
          image: DecorationImage(
              image: AssetImage("images/finalwater.png"), fit: BoxFit.cover)
            ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: AppBar(

            centerTitle: true,
            title: Text('Swatchta'),
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
//loggedInUser.email
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
              title: Text('List', style: TextStyle(fontSize: 15.0,
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
                _auth.signOut();setState(() {
                  Navigator.pop(context,WelcomeScreen.id);
                });

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
                  Text(
                    'Type the name of the area to get the status of its respective manholes !',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        place=value;
                      }
                      );

                    },
                    //Do something with the user input.
                    // controller.text="";
                    controller: controller,
//                  check=controller.text,
                    decoration:  kTextFileDecoration.copyWith(hintText:'eg- Kashmiri Gate'),
                  ),

                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              RoundedButton(title:'Search',colour: Colors.black87,onPressed:() {

//                Map area ={'area':this.place,'user':loggedInUser.email};
//                crudObj.addData(area).then((result){
//                  dialogTrigger(context);
//                }).catchError((e){
//                  print(e);
//                });
               _firestore.collection('area').add({'area':place,'user':loggedInUser.email});
               Navigator.pushNamed(context,MapedScreen.id);
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

getData() async{
  return await Firestore.instance.collection('area').getDocuments();
}

//Future<bool> dialogTrigger(BuildContext context) async{
//  return showDialog(
//    context:context,
//    barrierDismissible:false,
//    builder: (BuildContext context){
//      return AlertDialog(
//        title:Text('job done ',style: TextStyle(fontSize:15.0)),
//        content:Text('Added'),
//        actions:<Widget>[
//          FlatButton(
//            child: Text('Alright'),
//            textColor:Colors.blue,
//            onPressed:(){
//              Navigator.pushNamed(context,MapedScreen.id);
//            },
//          )
//        ],
//      );
//
//    }
//  );
//}