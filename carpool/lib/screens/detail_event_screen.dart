import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "event.dart";

class DetailEventScreen extends StatefulWidget {
  Event event = Event(
    Name: '',
    Owner: '',
    Date: '',
    Location: '',
    People: 0,
    Time: '',
    isFull: false,
  );

  DetailEventScreen(Event event) {
    this.event = event;
  }
  @override
  DetailEventScreenState createState() => DetailEventScreenState(event);
}

class DetailEventScreenState extends State<DetailEventScreen> {
  Event event = Event(
    Name: '',
    Owner: '',
    Date: '',
    Location: '',
    People: 0,
    Time: '',
    isFull: false,
  );
  final _firestore = FirebaseFirestore.instance;

  DetailEventScreenState(Event event) {
    this.event = event;
  }

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
        event.Name,
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 96.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(event.Name,
                  style: TextStyle(
                      fontSize: 31,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold)),
              Text(""),
              Text(event.Date,
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
              Text(""),
              Text(""),
              Text("Leaving from: " + event.Location,
                  style: TextStyle(fontSize: 18)),
              Text("Number of people: ", style: TextStyle(fontSize: 18)),
              Text("Time: " + event.Time, style: TextStyle(fontSize: 18)),
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
            ]),
      ),
    );
  }
}
