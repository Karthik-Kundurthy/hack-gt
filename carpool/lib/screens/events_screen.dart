import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carpool/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carpool/screens/detail_event_screen.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final messageController = TextEditingController();
  late User loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();
    getMessages();
  }

  void getMessages() async {
    await for (var snapshot in _firestore.collection('Events').snapshots()) {
      for (var event in snapshot.docs) {
        print(event.data());
      }
    }
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
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, 'create_screen');
              }),
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Upcoming events'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('Events').snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                final events = snapshot.data.docs;
                List<Padding> messageWidgets = [];
                for (var event in events) {
                  final messageWidget = Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Material(
                      color: Colors.blueAccent,
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailEventScreen(
                                  event.reference.id.toString()),
                            ),
                          );
                        },
                        minWidth: 200.0,
                        height: 125.0,
                        child: Text(
                          event['Name'] + "\n" + "\n" + event['Date'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                  messageWidgets.add(messageWidget);
                }
                return Expanded(
                  child: ListView(
                    children: messageWidgets,
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  String text;
  String sender;
  bool isMe;

  Bubble({required this.text, required this.sender, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12.0,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
