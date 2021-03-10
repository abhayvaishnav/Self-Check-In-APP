import 'package:HMApp/screens/otp_confirmation_screen_for_payment.dart';
import 'package:HMApp/widgets/custom_button.dart';
import 'package:HMApp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PhoneNoAuthForPayment extends StatefulWidget {
  @override
  _PhoneNoAuthForPaymentState createState() => _PhoneNoAuthForPaymentState();
}

class _PhoneNoAuthForPaymentState extends State<PhoneNoAuthForPayment> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String phoneNo;

  FocusNode _blankFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var widthPiece = MediaQuery.of(context).size.width / 10;
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 54, 58, 70),
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(_blankFocusNode);
            },
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthPiece),
                      child: buildCustomTextFieldForMobileNo()),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: widthPiece),
                    child: buildCustomButtonForSendOTPButton(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Home Screen',
      ),
    );
  }

  CustomButton buildCustomButtonForSendOTPButton(BuildContext context) {
    return CustomButton(
        text: 'Send OTP',
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context) =>
                    OTPConfirmationPageForPayment(phoneNo: phoneNo)));
          }
        });
  }

  CustomTextField buildCustomTextFieldForMobileNo() {
    return CustomTextField(
        maxLength: 10,
        hintText: 'Enter 10 digit mobile no.',
        inputType: TextInputType.phone,
        onSaved: ((value) {
          phoneNo = '+91$value';
        }),
        validator: (value) {
          if (value.length < 10 || value.length > 10) {
            return "Invalid";
          } else {
            print(value.length);
            _formKey.currentState.save();
            return null;
          }
        });
  }
}
