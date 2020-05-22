import 'package:flutter/material.dart';
import 'components.dart';
import 'rounded_button.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sewerappp/maped_screen.dart';
import 'components.dart';
import 'rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapedScreen extends StatefulWidget{
static const String id='maped_screen';
@override
_MapedScreenState createState() => _MapedScreenState();
}

class _MapedScreenState extends State<MapedScreen> {
//marker
  List<Marker> allMarkers=[];
  GoogleMapController _controller;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
//
//wrute in maps also ..have to see
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
  @override
  void initState(){
      super.initState();
      getCurrentUser();

    super.initState();
    allMarkers.add(Marker(
    markerId:MarkerId('myMarker'),
    draggable: false,
    //using icon:, can change the shape and  color
    onTap:() {
      print('Marker Tapped');},
    position: LatLng(21.0000,78.0000)
    )
    ,);

    super.initState();
    allMarkers.add(Marker(
        markerId:MarkerId('myMarker'),
        draggable: false,
        onTap:() {
          print('Marker Tapped');},
        position: LatLng(28.38,77.12)
    )
      ,);
  super.initState();
  allMarkers.add(Marker(
  markerId:MarkerId('myMarker'),
  draggable: false,
  onTap:() {
  print('Marker Tapped');},
  position: LatLng( 28.481216,77.019135)
  )
  ,);
//super.initState();
//allMarkers.add(Marker(
//markerId:MarkerId('myMarker'),
//draggable: false,
//onTap:() {
//print('Marker Tapped');},
//position: LatLng(28.38,77.12)
//)
//,);
}
//  String result="";
//  String check="";
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
            title: Text('Swatchta'),
            actions: <Widget>[
            ],
            backgroundColor: Colors.black,
            elevation: 50.0,
            brightness: Brightness.dark,
          ),
        ),
        backgroundColor: Colors.transparent,
        body:
        Stack(
            children:[ Container(height: MediaQuery
                .of(context)
                .size
                .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: GoogleMap(initialCameraPosition: CameraPosition(
                  target: LatLng(21.0000, 78.0000),
                  zoom: 12.0
              ),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: movetoDelhi,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.red
                    ),
                    child: Icon(Icons.backspace,color:Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: movetoKedarnath,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black
                    ),
                    child: Icon(Icons.forward,color:Colors.white),
                  ),
                ),
              )
          ] ,
    ),
    ),
    );
  }
        void mapCreated(controller)
    {
setState(() {
  _controller=controller;
});
    }
    movetoKedarnath(){
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(30.73462,79.066895),
        zoom: 12.0,bearing: 45.0,tilt: 45.0)));
    }

  movetoDelhi(){
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(21.0000, 78.0000),
        zoom: 12.0,bearing: 45.0,tilt: 45.0)));
  }
//    navigatorObservers: <NavigatorObserver>[controller.overlayController],
}
