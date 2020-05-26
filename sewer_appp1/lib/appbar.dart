
import 'package:flutter/material.dart';

  class AppBar extends StatefulWidget{
    AppBar();
    @override
    _AppBarState createState() => _AppBarState();

  }

  class _AppBarState extends State<AppBar> {

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home:Scaffold(
          appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
      child: Container(
      decoration: BoxDecoration(
      boxShadow: [BoxShadow(
      color: Colors.black12,
      spreadRadius: 5,
      blurRadius: 2
      )]
      ),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Container(
      decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
      ),
      child: Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Icon(Icons.navigate_before,size: 40,color: Colors.white,),
      Text("Swatchta",style: TextStyle(fontSize: 30,color: Colors.white),),
      Icon(Icons.navigate_before,color: Colors.transparent,),
      ],
      ),
      ),
      ),
      ),
      ),
      ),);

    }

  }

//class Choice {
//  const Choice({this.title, this.icon});
//
//  final String title;
//  final IconData icon;
//}
//
//const List<Choice> choices = const <Choice>[
//  const Choice(title: 'Car', icon: Icons.directions_car),
//  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
//  const Choice(title: 'Boat', icon: Icons.directions_boat),
//  const Choice(title: 'Bus', icon: Icons.directions_bus),
//  const Choice(title: 'Train', icon: Icons.directions_railway),
//  const Choice(title: 'Walk', icon: Icons.directions_walk),
//];
//
//class ChoiceCard extends StatelessWidget {
//  const ChoiceCard({Key key, this.choice}) : super(key: key);
//
//  final Choice choice;
//
//  @override
//  Widget build(BuildContext context) {
//    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
//    return Card(
//      color: Colors.white,
//      child: Center(
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Icon(choice.icon, size: 128.0, color: textStyle.color),
//            Text(choice.title, style: textStyle),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//void main() {
//  runApp(BasicAppBarSample());
//}
