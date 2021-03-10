import 'package:flutter/material.dart';

import 'otp_confirmation_screen.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

FocusNode myFocusNode = new FocusNode();

class _LoginPageState extends State<LoginPage> {
  String phoneNo;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: 80, left: 40, right: 40),
            color: Color.fromARGB(255, 54, 58, 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text("Log In",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 30),
                        child: TextFormField(
                            onSaved: (value) {
                              phoneNo = '+91$value';
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Color.fromARGB(255, 247, 172, 27)),
                              icon: Icon(Icons.phone, color: Colors.white),
                              labelText: 'Enter Your Phone Number',
                            ),
                            maxLength: 10,
                            validator: (value) {
                              if (value.length < 10 || value.length > 10) {
                                return "Invalid";
                              } else {
                                print(value.length);
                                _formKey.currentState.save();
                                return null;
                              }
                            }),
                      ),
                      Container(
                        width: 320,
                        height: 60,
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(50),
                          // color: Colors.black26,
                          color: Color.fromARGB(210, 247, 172, 27),
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OTPConfirmationPage(phoneNo: phoneNo),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Send OTP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
