import "package:flutter/material.dart";

class DetailEventScreen extends StatefulWidget {
  @override
  DetailEventScreenState createState() => DetailEventScreenState();
}

class DetailEventScreenState extends State<DetailEventScreen> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Event",
        ) 
      ), 
      body: Column(children: <Widget>[Text("Homecoming concert"), Text("Georgia Tech")]),
    );
  }
}