import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class DetailEventScreen extends StatefulWidget {
  String _eventID = "";
  DetailEventScreen(String eventID) {
    this._eventID = eventID;
  }
  @override
  DetailEventScreenState createState() => DetailEventScreenState(_eventID);
}

class DetailEventScreenState extends State<DetailEventScreen> {
  String _eventID = "";
  late DocumentSnapshot event;
  final _firestore = FirebaseFirestore.instance;

  DetailEventScreenState(String eventID) {
    this._eventID = eventID;
  }
  void initState() {
    // TODO: implement initState
    super.initState();

    getEvent();
  }

  void getEvent() async {
    this.event = await _firestore.collection('Events').doc(this._eventID).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
        this._eventID,
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(event['Name'],
                  style: TextStyle(
                      fontSize: 31,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold)),
              Text(""),
              Text(event['Date'],
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
              Text(""),
              Text(""),
              Text("Leaving from: " + event['Location'],
                  style: TextStyle(fontSize: 18)),
              Text("Number of people: " + event['People'],
                  style: TextStyle(fontSize: 18)),
              Text("Time: " + event['Time'], style: TextStyle(fontSize: 18)),
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
