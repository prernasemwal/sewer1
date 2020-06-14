import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sewerappp/services/auth.dart';
import 'package:sewerappp/services/database.dart';


class MapScreen extends StatefulWidget {

  static const String id='map_screen';
  final String area;

  MapScreen(this.area);

  @override
  _MapScreenState createState() => _MapScreenState(this.area);
}

class _MapScreenState extends State<MapScreen> {


  String area;
  _MapScreenState(this.area);

  final AuthService _auth = AuthService();
  final _firestore = Firestore.instance;

  List<Marker> allMarker = [];
 // GoogleMapController _controller;
  Completer<GoogleMapController> _controller = Completer();

  void initState(){

    super.initState();
    gettingLocationO();
   // _onPressed();
  }

  @override

  Widget build(BuildContext context){
    return WillPopScope(


        onWillPop: () {
      // Write some code to control things, when user press Back navigation button in device navigationBar
      moveToLastScreen();
    },

      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
              double.infinity, 80,
          ),
          child: AppBar(

            centerTitle: true,
            title:Text(' New Delhi',
              style: TextStyle(
                color: Colors.black,
              ),) ,
            backgroundColor: Colors.blueGrey,
            elevation: 50.0,
            brightness: Brightness.dark,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.search),
                label: Text(''),
                onPressed:() {

                },
              )
            ],
          ),
        ),

        body: ListView(
          children: <Widget>[
            Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height ,
                      width: double.infinity,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(28.7041,77.1025),
                          zoom: 10.0,

                        ),
                        markers: Set.from(allMarker),
                        onMapCreated: mapController,
                      )
                  ),

                ],
              )
            ],
          ),
          ],
        )
    )
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }


  void fetchData(){
   // DatabaseService(area: area).readData(7, '1');
  }

  void gettingLocationO() async {
    String ar = area;
    print(ar.runtimeType);

    await for(var snapshot in _firestore.collection(area).snapshots()){

   for(var loc in snapshot.documents) {

        print(loc.data.values.elementAt(0));
        print(loc.data.values.elementAt(1));
        print(loc.data.values.elementAt(2));
       // print(loc['Coordinates'].latitude);
       // print(loc['Coordinates'].longitude);

          allMarker.add(Marker(
              markerId: MarkerId('myMarkder'),
              draggable: true,
              infoWindow: InfoWindow(
               title: (loc.data.values.elementAt(2)),
              ),
              onTap: () {
                print("marker tapped");
              },
              position: LatLng(
                  loc['Coordinates'].latitude, loc['Coordinates'].longitude),
          //  zIndex: 12.0,
            flat:true,


          )
          );
      }

    }
  }


   void mapController(GoogleMapController controller){
    _controller.complete(controller);
   }
}


