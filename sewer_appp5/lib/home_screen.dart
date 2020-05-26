import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'appbar.dart';

class HomeScreen extends StatefulWidget {

  static const String id='home_screen';
//  final GoogleMapOverlayController controller;
//
//  const MapUiBody(this.controller, GoogleMapController mapController);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
//    GoogleMapController.init();
//    final GoogleMapOverlayController controller =
//    GoogleMapOverlayController.fromSize(width: 300.0, height: 200.0);
//    final Widget mapWidget = GoogleMapOverlay(controller: controller);
  return MaterialApp(
    home:Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: AppBar(

        centerTitle: true,
        title:Text('Swasthya') ,
actions: <Widget>[
           ],
backgroundColor: Colors.black,
elevation: 50.0,
brightness: Brightness.dark,

//          child: Container(
//            decoration: BoxDecoration(
//                boxShadow: [BoxShadow(
//                    color: Colors.black12,
//                    spreadRadius: 5,
//                    blurRadius: 2
//                )]
//            ),
//            width: MediaQuery.of(context).size.width,
//            height: 100,
//            child: Container(
//              decoration: BoxDecoration(
//                  color: Colors.black,
//                  //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
//              ),
//              child: Container(
//                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: [
//                    //Icon(Icons.format_list_bulleted,size: 30,color: Colors.white,),
//                    Text("Swatchta",style: TextStyle(fontSize: 30,color: Colors.white),),
//                    Icon(Icons.chat,color: Colors.white,),
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ),
      ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
//            DrawerHeader
//              child: Text('Drawer Header'),
//              decoration: BoxDecoration(
//                color: Colors.blue,
//              ),
//            ),
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
body:Container(height: 400.0,
width: MediaQuery.of(context).size.width,
child: GoogleMap(initialCameraPosition:CameraPosition(target: LatLng(21.0000,-78.0000),zoom:12.0
  ),
),),),);
//    navigatorObservers: <NavigatorObserver>[controller.overlayController],
  }
}

//class MapsDemo extends StatelessWidget {
//  MapsDemo(this.mapWidget, this.controller);
//
//  final Widget mapWidget;
//  final GoogleMapController controller;
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.all(15.0),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          Center(child: mapWidget),
//          RaisedButton(
//            child: const Text('Go to London'),
//            onPressed: () {
//              controller.animateCamera(CameraUpdate.newCameraPosition(
//                const CameraPosition(
//                  bearing: 270.0,
//                  target: LatLng(51.5160895, -0.1294527),
//                  tilt: 30.0,
//                  zoom: 17.0,
//                ),
//              ));
//            },
//          ),
//        ],
//      ),
//    );
//  }
//}