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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[Text(""),
            Text(""),
            Text(""),
            Text(""),
            Text(""),
            Text("Homecoming Concert", style: TextStyle(fontSize: 31, fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
            Text(""),
            Text("October 20, 2021", style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
            Text(""),
            Text(""),
            Text("Leaving from: Buckhead, GA", style: TextStyle(fontSize: 18)),
            Text("Number of people: 6", style: TextStyle(fontSize: 18)),
            Text("Time: 7:30pm", style: TextStyle(fontSize: 18)),
            Text(""),
            Text(""),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, 'events_screen');
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Join CarPool',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            ]
          ),
    ),
    );
  }
}