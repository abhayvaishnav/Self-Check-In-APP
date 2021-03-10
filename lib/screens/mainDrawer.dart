import 'package:HMApp/screens/login.dart';
import 'package:HMApp/services/phone_auth.dart';
import 'package:flutter/material.dart';

import 'package:HMApp/screens/allotedRoom.dart';
import 'package:HMApp/screens/homepage.dart';

import 'showCheckInDetails.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 54, 58, 70),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              ListTile(
                leading: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
                title: Text("Find Room",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text("Alloted Room",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllotedRoom(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.format_align_left,
                  color: Colors.white,
                ),
                title: Text("Check In Details",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowCheckInDetails(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text("Log Out",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onTap: () async {
                  PhoneAuth().signout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
