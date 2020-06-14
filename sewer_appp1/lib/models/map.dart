import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sewerappp/models/area_model.dart';

class MapMarker extends StatefulWidget {
  @override
  _MapMarkerState createState() => _MapMarkerState();
}

class _MapMarkerState extends State<MapMarker> {

  List<Marker> allMarker = [];
  Completer<GoogleMapController> _controller = Completer();


  void initState(){

    super.initState();
    /*allMarker.add(Marker(
      markerId: MarkerId('myMarkder'),
      draggable: true,
     // infoWindow: InfoWindow(
       // title: (loc.data.values.elementAt(2)),
      //),
      onTap: () {
        print("marker tapped");
      },
      position: LatLng(28.7041,77.1025
         // loc['Coordinates'].latitude, loc['Coordinates'].longitude
      ),
      //  zIndex: 12.0,
     // flat:true,


    )
    );*/
   // gettingLocationO();
    // _onPressed();
  }
  @override
  Widget build(BuildContext context) {

    final marker = Provider.of<List<SewerInfo>>(context);
    //print(marker);
    //print(marker.documents);
   // for(var doc in marker.documents)
     // print(doc.data);

    marker.forEach((map)
    {
      print(map.level);
      print(map.id);
      print(map.longitude);
      print(map.latitude);
      allMarker.add(Marker(
        markerId: MarkerId('myMarkder'),
        draggable: true,
        infoWindow: InfoWindow(
        title: (map.id),
        ),
        onTap: () {
          print("marker tapped");
        },
        position: LatLng(map.latitude,map.longitude
          // loc['Coordinates'].latitude, loc['Coordinates'].longitude
        ),
        //  zIndex: 12.0,
        // flat:true,


      )
      );
    });
    return ListView(
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
                        zoom: 12.0,

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
    );
  }

  void mapController(GoogleMapController controller){
    _controller.complete(controller);
  }


/*  void gettingLocationO() async {
    // final snapshot = Firestore.instance.collection(area);
    await for(var snapshot in _firestore.collection('kashmiri gate').snapshots()){
      print('outside');
      print(snapshot);
      print(snapshot.documents);
      for(var loc in snapshot.documents) {
        print("inside");
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
   }*/

}
