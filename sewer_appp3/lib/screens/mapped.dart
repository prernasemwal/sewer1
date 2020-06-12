import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sewerappp/services/auth.dart';


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
  double longitude ;
  double latitude ;

  void initState(){
    print('hello');
    gettingLocationO();
    print('bye');
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
          preferredSize: Size(double.infinity, 100),
          child: AppBar(

            centerTitle: true,
            title:Text('Swasthya',
              style: TextStyle(
                color: Colors.black,
              ),) ,
            backgroundColor: Colors.blue,
            elevation: 50.0,
            brightness: Brightness.dark,
          ),
        ),

        body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(28.7041,77.1025),
                    zoom: 11.0,

                  ),
                  markers: Set.from(allMarker),
                )
            ),

    )
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }


  void gettingLocationO() async {
    print("second hello");
    await for(var snapshot in _firestore.collection('latlong').snapshots()){
      for(var loc in snapshot.documents) {
        print('third hello');
        if( area == 'Kashmiri Gate' ||  area == 'kashmiri gate') {
          print('fouth hello');
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
              onTap: () {
                print("marker tapped");
              },
              position: LatLng(
                  loc['Coordinates'].latitude, loc['Coordinates'].longitude)
          ));
          // print('bye');
          }

          else if( area == 'Dhaula Kuan' || area  == 'dhaula kuan') {
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



}


