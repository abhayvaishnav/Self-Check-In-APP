import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color textColor;
  final Color buttonColor;
  final void Function() onPressed;
  final bool autoSize;
  final String text;
  const CustomButton(
      {@required this.text,
      this.buttonColor,
      this.onPressed,
      this.textColor,
      Key key,
      this.autoSize = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: autoSize ? null : double.infinity,
      height: autoSize ? null : 50,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: buttonColor ?? Color.fromARGB(210, 247, 172, 27),
        onPressed: onPressed ?? () {},
        child: Text(text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor ?? Colors.white,
            )),
      ),
    );
  }
}
