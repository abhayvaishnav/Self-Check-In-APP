import 'package:HMApp/screens/login.dart';
import 'package:HMApp/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RouteBasedOnAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data != null) {
              return Welcome();
            } else {
              return LoginPage();
            }
          }

          return CircularProgressIndicator();
        });
  }
}
