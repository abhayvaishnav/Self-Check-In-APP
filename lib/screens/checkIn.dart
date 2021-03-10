import 'package:HMApp/database/databaseHelper.dart';
import 'package:HMApp/models/userDetails.dart';
import 'package:HMApp/widgets/CheckInDateAndTime.dart';
import 'package:HMApp/widgets/CheckOutDateAndTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';

class CheckIn extends StatefulWidget {
  static const routeName = '/checkIn.dart';

  @override
  State<StatefulWidget> createState() => _CheckInState();
}

FocusNode myFocusNode = new FocusNode();

class _CheckInState extends State<CheckIn> {
  Todo todo;
  final descriptionTextController = TextEditingController();
  final titleTextController = TextEditingController();
  final ageTextController = TextEditingController();
  final checkInDateTextController = TextEditingController();
  final checkInTimeTextController = TextEditingController();
  final checkOutDateTextController = TextEditingController();
  final checkOutTimeTextController = TextEditingController();
  final adultTextController = TextEditingController();
  final childrenTextController = TextEditingController();
  final idTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (todo != null) {
      descriptionTextController.text = todo.content;
      titleTextController.text = todo.title;
    }
  }

  @override
  void dispose() {
    super.dispose();
    descriptionTextController.dispose();
    titleTextController.dispose();
  }

  String idProof;
  List idCount = ["Aadhar Card", "Passport"];
  FocusNode _blankFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill Check In Details "),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 54, 58, 70),
      ),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              color: Color.fromARGB(255, 54, 58, 70),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleTextController,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      keyboardType: TextInputType.name,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      decoration: new InputDecoration(
                        labelText: 'Name',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 247, 172, 27)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 247, 172, 27)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: descriptionTextController,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      keyboardType: TextInputType.emailAddress,
                      decoration: new InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 247, 172, 27)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 247, 172, 27)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: ageTextController,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      decoration: new InputDecoration(
                        labelText: 'Age',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 247, 172, 27)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 247, 172, 27)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(top: 6, bottom: 6),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          const Radius.circular(10),
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckInDateAndTime(),
                            ),
                          );
                        },
                        child: Text(
                          "Date Of Arrival And Check In Time",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 247, 172, 27),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(top: 6, bottom: 6),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          const Radius.circular(10),
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckOutDateAndTime(),
                            ),
                          );
                        },
                        child: Text(
                          "Date Of Departure And Check Out Time",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 247, 172, 27),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: adultTextController,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      decoration: new InputDecoration(
                        labelText: 'Number of Adults',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 247, 172, 27)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 247, 172, 27)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: childrenTextController,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      decoration: new InputDecoration(
                        labelText: 'Number of Children',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 247, 172, 27)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 247, 172, 27)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select ID Proof",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 247, 172, 27))),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 247, 172, 27),
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: DropdownButton(
                            dropdownColor: Color.fromARGB(255, 247, 172, 27),
                            value: idProof,
                            onChanged: (newId) {
                              setState(() {
                                idProof = newId;
                              });
                            },
                            items: idCount.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black)),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: idTextController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(14)],
                      decoration: new InputDecoration(
                        labelText: 'ID Details',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 247, 172, 27)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 247, 172, 27)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: 180,
                      height: 50,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(210, 247, 172, 27),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                              _saveTodo(titleTextController.text,
                                  descriptionTextController.text);
                              setState(() {});
                            }
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
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _saveTodo(String title, String content) async {
    if (todo == null) {
      DatabaseHelper.instance.insertTodo(Todo(
          title: titleTextController.text,
          content: descriptionTextController.text));
    } else {
      await DatabaseHelper.instance
          .updateTodo(Todo(id: todo.id, title: title, content: content));
    }
  }
}
