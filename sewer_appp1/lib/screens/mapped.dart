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

  void initState(){

    gettingLocationO();
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
            title:Text('Swatchta',
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
    await for(var snapshot in _firestore.collection('latlong').snapshots()){
      for(var loc in snapshot.documents) {
        //print("hello");
        print(loc.data.values.elementAt(0));
       print(loc['Coordinates'].latitude);
       print(loc['Coordinates'].longitude);
       if(loc.data.values.elementAt(0).toString() ==  area ){
         print('found');
       }
       else{
         print('not found');
       }
        if(loc.data.values.elementAt(0) == area) {
          print(area);
          print('found');
          allMarker.add(Marker(
              markerId: MarkerId('myMarkder'),
              draggable: true,
              onTap: () {
                print("marker tapped");
              },
              position: LatLng(loc['Coordinates'].latitude, loc['Coordinates'].longitude)
          ));
              break;
          }

       /*   else if( area == 'Dhaula Kuan' || area  == 'dhaula kuan') {
            print(area);
            print(loc['Coordinates'].latitude);
            print(loc['Coordinates'].longitude);
          allMarker.add(Marker(
              markerId: MarkerId('myMarkder'),
              draggable: true,
              onTap: (){
                print("marker tapped");
              },
              position: LatLng(loc['Coordinates'].latitude,loc['Coordinates'].longitude)
          ));
           }

        else if( area == 'kapashera border' || area  == 'Kapashera Border') {
          print(area);
          print(loc['Coordinates'].latitude);
          print(loc['Coordinates'].longitude);
          allMarker.add(Marker(
              markerId: MarkerId('myMarkder'),
              draggable: true,
              onTap: (){
                print("marker tapped");
              },
              position: LatLng(loc['Coordinates'].latitude,loc['Coordinates'].longitude)
          ));
        }
        else if( area == 'Palam' || area  == 'palam') {
          print(area);
          print(loc['Coordinates'].latitude);
          print(loc['Coordinates'].longitude);
          allMarker.add(Marker(
              markerId: MarkerId('myMarkder'),
              draggable: true,
              onTap: (){
                print("marker tapped");
              },
              position: LatLng(loc['Coordinates'].latitude,loc['Coordinates'].longitude)
          ));
        }

        else if( area == 'Chandani Chowk' || area  == 'chandani chowk') {
          print(area);
          print(loc['Coordinates'].latitude);
          print(loc['Coordinates'].longitude);

          allMarker.add(Marker(
              markerId: MarkerId('myMarkder'),
              draggable: true,
              onTap: (){
                print("marker tapped");
              },
              position: LatLng(loc['Coordinates'].latitude,loc['Coordinates'].longitude)
          ));
        }


        */

        //  break;
      }
    }
  }



}


