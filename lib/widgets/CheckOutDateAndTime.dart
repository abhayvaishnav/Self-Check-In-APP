import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckOutDateAndTime extends StatefulWidget {
  @override
  _CheckOutDateAndTimeState createState() => _CheckOutDateAndTimeState();
}

class _CheckOutDateAndTimeState extends State<CheckOutDateAndTime> {
  double _height;
  double _width;

  // ignore: unused_field
  String _setTime, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 58, 70),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Check Out Date and Time'),
        backgroundColor: Color.fromARGB(255, 54, 58, 70),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: _width,
          height: _height,
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Column(
                children: <Widget>[
                  Text(
                    'Choose Check Out Date',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      width: _width / 1.7,
                      height: _height / 9,
                      margin: EdgeInsets.only(top: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: TextFormField(
                        style: TextStyle(fontSize: 40),
                        textAlign: TextAlign.center,
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _dateController,
                        onSaved: (String val) {
                          _setDate = val;
                        },
                        decoration: InputDecoration(
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            // labelText: 'Time',
                            contentPadding: EdgeInsets.only(top: 0.0)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Column(
                children: <Widget>[
                  Text(
                    'Choose Check Out Time',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                  InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      width: _width / 1.7,
                      height: _height / 9,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: TextFormField(
                        style: TextStyle(fontSize: 40),
                        textAlign: TextAlign.center,
                        onSaved: (String val) {
                          _setTime = val;
                        },
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _timeController,
                        decoration: InputDecoration(
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.all(5)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                width: 140,
                height: 50,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(210, 247, 172, 27),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Submit",
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
      ),
    );
  }
}
