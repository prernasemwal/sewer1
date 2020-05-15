import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sewerappp/models/user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  static const String id='home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home:Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: AppBar(

            centerTitle: true,
            title:Text('Swasthya') ,
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
        body:Container(
          height: 400.0,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(initialCameraPosition:CameraPosition(target: LatLng(21.0000,-78.0000),zoom:12.0
          ),
          ),),),);
  }
}
