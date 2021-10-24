import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "event.dart";
import 'package:firebase_auth/firebase_auth.dart';

class DetailEventScreen extends StatefulWidget {
  Event event = Event(
    id: '',
    Name: '',
    Owner: '',
    Date: '',
    Location: '',
    People: 0,
    Time: '',
    isFull: false,
    members: [''],
  );

  DetailEventScreen(Event event) {
    this.event = event;
  }
  @override
  DetailEventScreenState createState() => DetailEventScreenState(event);
}

class DetailEventScreenState extends State<DetailEventScreen> {
  Event event = Event(
    id: '',
    Name: '',
    Owner: '',
    Date: '',
    Location: '',
    People: 0,
    Time: '',
    isFull: false,
    members: [''],
  );
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  DetailEventScreenState(Event event) {
    this.event = event;
  }

  void initState() {
    getCurrentUser();
    // TODO: implement initState
    super.initState();
  }

  void getCurrentUser() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
            event.Name,
          ),
          backgroundColor: Colors.blueAccent),
      body: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 120),
        padding: EdgeInsets.all(94),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(event.Name,
                  textAlign: TextAlign.values[2],
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold)),
              Text(""),
              Text(event.Date,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19, fontStyle: FontStyle.italic)),
              Text(""),
              Text(""),
              Text("Leaving from: " + "\n" + event.Location,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16)),
              Text(""),
              Text("Number of people: " + event.People.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16)),
              Text("Time: " + event.Time,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16)),
              Text(""),
              Text(""),
              event.isFull
                  ? Text('Not available to join')
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () async {
                            DocumentSnapshot snap = await _firestore
                                .collection('Events')
                                .doc(event.id)
                                .get();
                            List temp = snap['members'];
                            temp.add(loggedInUser.email);
                            await _firestore
                                .collection('Events')
                                .doc(event.id)
                                .update({
                              'members': temp,
                            });
                            if (snap['members'].length >= snap['People']) {
                              await _firestore
                                  .collection('Events')
                                  .doc(event.id)
                                  .update({
                                'isFull': true,
                              });
                            }
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
