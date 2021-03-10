import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:HMApp/screens/mainDrawer.dart';

class AllotedRoom extends StatefulWidget {
  @override
  _AllotedRoomState createState() => _AllotedRoomState();
}

class _AllotedRoomState extends State<AllotedRoom> {
  String uid, phone;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Alloted Room"),
            backgroundColor: Color.fromARGB(255, 54, 58, 70),
            elevation: 0,
          ),
          drawer: Drawer(child: MainDrawer()),
          body: Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Your Phone is: $phone',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your User Id is $uid ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Room Alloted Number is 01",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    phone = FirebaseAuth.instance.currentUser.phoneNumber;
    uid = FirebaseAuth.instance.currentUser.uid;
  }
}
