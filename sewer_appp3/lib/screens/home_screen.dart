import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sewerappp/models/user.dart';
import 'package:provider/provider.dart';
import 'package:sewerappp/screens/mapped.dart';
import 'package:sewerappp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sewerappp/shared/components.dart';
import 'package:sewerappp/shared/rounded_button.dart';
import 'package:sewerappp/screens/mapped.dart';

class HomeScreen extends StatefulWidget {

  static const String id='home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final AuthService _auth = AuthService();
  final _firestore = Firestore.instance;

  final TextEditingController t1=new TextEditingController(text: " ");

  List<Marker> allMarker = [];
  double longitude ;
  double latitude ;


  /*void  initState(){
    allMarker.add(Marker(
        markerId: MarkerId('myMarkder'),
        draggable: true,
        onTap: (){
          print("marker tapped");
        },
        position: LatLng(28.7041,77.1025)
    ));
  }*/
  
  @override

  void getLocation () async{
    final data1 = await _firestore.collection('latlong').getDocuments();
    for(var val in data1.documents){
      print(val.data);
    }
  }

  void gettingLocationO() async {
    await for(var snapshot in _firestore.collection('latlong').snapshots()){
      for(var loc in snapshot.documents){
        if(t1.text == 'Kashmiri Gate' || t1.text == 'kashmiri gate') {
            print(loc.data.keys.elementAt(0));
            print(loc.data.values.elementAt(0));
           // print(loc.data.keys.elementAt(1));
           //print(loc.data.values.elementAt(1));
           // print(loc.data.keys.elementAt(2));
           // print(loc.data.values.elementAt(2));
          //  print('hello');
          // latitude = loc['Coordinates'].latitude;
            //latitude = loc.data.values.elementAt(1);
            //print(latitude);
            //longitude = loc.data.values.elementAt(2);
            //longitude = loc['Coordinates'].longitude;
           // print(longitude);
            allMarker.add(Marker(
                markerId: MarkerId('myMarkder'),
                draggable: true,
                onTap: (){
                  print("marker tapped");
                },
                position: LatLng(loc['Coordinates'].latitude,loc['Coordinates'].longitude)
            ));
           // print('bye');
        }

        else if(t1.text == 'Dhaula Kuan' || t1.text == 'dhaula kuan') {
          print(loc.data.keys.elementAt(0));
          print(loc.data.values.elementAt(0));

          allMarker.add(Marker(
              markerId: MarkerId('myMarkder'),
              draggable: true,
              onTap: (){
                print("marker tapped");
              },
              position: LatLng(loc['Coordinates'].latitude,loc['Coordinates'].longitude)
          ));
        }


      }
    }
  }

  void _onPressed() async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    _firestore.collection("info").document(firebaseUser.uid).setData(
        {
          "Area" : "Kahmiri Gate",
          "Coordinates" : [28.6665, 77.2333],
        }).then((_){
      print("success!");
    });
  }



  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: AppBar(

            centerTitle: true,
            title:Text('Swatchta',
            style: TextStyle(
              color: Colors.black,
            ),) ,
            backgroundColor: Colors.blue,
            elevation: 50.0,
              actions: <Widget>[
                FlatButton.icon(
                         icon: Icon(Icons.person),
                        label: Text('logout'),
                        onPressed: () async {
                                await _auth.signOut();
                          },
                ),
               /* FlatButton.icon(
                  icon: Icon(Icons.message),
                  label: Text('data'),
                  onPressed: () {
                  /* _firestore.collection('latlong').add(
                      {
                        'area' : 'mahipal',
                        'loc' : 'rangpuri'
                      }

                  );*/
                gettingLocationO();
                  //getLocation();
                 //   _onPressed();
                  },

                ),*/
              ],
            brightness: Brightness.dark,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[

              UserAccountsDrawerHeader(
                decoration:BoxDecoration(
                  color: Colors.black87,
                ),
                accountName: Text("Prerna Semwal"),
                accountEmail: Text("prernasemwal1998@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                  Theme.of(context).platform == TargetPlatform.iOS
                      ? Colors.black
                      : Colors.white,
                  child: Text(
                    "P",
                    //have to add here the first alphabet of the account name
                    style: TextStyle(fontSize: 40.0,
                      color:Colors.black,),
                  ),
                ),
              ),

              ListTile(
                title: Text('Home',style: TextStyle(fontSize: 15.0,
                  color:Colors.black,),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Contact',style: TextStyle(fontSize: 15.0,
                  color:Colors.black,),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Settings',style: TextStyle(fontSize: 15.0,
                  color:Colors.black,),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body:Padding(
          padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 100.0),
          child: ListView(
            children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Enter area you want to search ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: t1,
                  decoration:  kTextFileDecoration.copyWith(hintText:'Enter Area'),
                ),

                SizedBox(
                  height: 30.0,
                ),
                RoundedButton(
                  title: "Search",
                  colour: Colors.black,
                  onPressed: (){
                     print(t1.text);
                     navigateToDetail(t1.text);
                  },

                ),
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToDetail(String area) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MapScreen(area);
    }));
  }


}
