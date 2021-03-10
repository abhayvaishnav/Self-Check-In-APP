import 'package:HMApp/screens/allotedRoom.dart';
import 'package:HMApp/services/phone_auth.dart';
import 'package:HMApp/widgets/custom_button.dart';
import 'package:HMApp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class OTPConfirmationPageForPayment extends StatefulWidget {
  final String phoneNo;

  OTPConfirmationPageForPayment({Key key, this.phoneNo}) : super(key: key);

  @override
  _OTPConfirmationPageForPaymentState createState() =>
      _OTPConfirmationPageForPaymentState();
}

class _OTPConfirmationPageForPaymentState
    extends State<OTPConfirmationPageForPayment> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String phoneNo;
  FocusNode _blankFocusNode = FocusNode();
  PhoneAuth phoneAuth;

  String _otp;

  @override
  void initState() {
    super.initState();
    phoneNo = widget.phoneNo;
    phoneAuth = PhoneAuth(phoneNo: widget.phoneNo);
    phoneAuth.verifyPhone(context);
  }

  String numberCountValidator(value, int requiredCount) {
    if (value.length < requiredCount || value.length > requiredCount) {
      return "Invalid";
    } else {
      _formKey.currentState.save();
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var heightPiece = MediaQuery.of(context).size.height / 10;
    var widthPiece = MediaQuery.of(context).size.width / 10;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 54, 58, 70),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(_blankFocusNode);
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(widthPiece / 2),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildOTPsentText(),
              SizedBox(height: 20),
              showRegisteredMobileNumber(),
              SizedBox(height: 20),
              buildEnterOTPText(),
              SizedBox(height: 20),
              otpInputFieldConfig(),
              SizedBox(height: 20),
              CustomButton(
                text: 'Proceed',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    print(_otp);
                    phoneAuth.signIn(context, smsOTP: _otp);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllotedRoom()));
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    ));
  }

  CustomTextField otpInputFieldConfig() {
    return CustomTextField(
        hintText: 'Your otp here',
        maxLength: 6,
        inputType: TextInputType.number,
        onSaved: ((value) {
          _otp = value;
        }),
        validator: (value) => numberCountValidator(value, 6));
  }

  buildOTPsentText() {
    return Text('Verify the otp sent to this number',
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ));
  }

  showRegisteredMobileNumber() {
    return Text(widget.phoneNo,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22));
  }

  buildEnterOTPText() {
    return Text(
      'Enter OTP',
      style: TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
