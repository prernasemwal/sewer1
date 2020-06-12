
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
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)
                )
        ),
      child: Container(
             margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                            Icon(Icons.navigate_before,size: 40,color: Colors.white,),
                            Text(
                              "Swatchta",
                              style: TextStyle(
                                  fontSize: 30,color: Colors.white),
                                ),
                             Icon(Icons.navigate_before,color: Colors.transparent,),
                            ],
                          ),
                  ),
              ),
              ),
          ),
      ),
      );

    }

  }
