import 'package:flutter/material.dart';

class Chips extends StatefulWidget {
  @override
  _ChipsState createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Select Filters"),
        backgroundColor: Color.fromARGB(255, 54, 58, 70),
        centerTitle: true,
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 20),
              icon: Icon(Icons.check),
              onPressed: () => Navigator.pop(context))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                  title: Text(
                "Filters",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Wrap(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.all(2),
                        child: FilterChip(
                            backgroundColor: Colors.orange,
                            elevation: 4,
                            label: Text("Short By User Ratings"),
                            onSelected: (bool sel) {
                              sel = true;
                            }),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Short By Relecence"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Short By Price Low to High"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Short By Price High to Low"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListTile(
                  title: Text(
                "Amanities",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Wrap(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(2),
                        child: FilterChip(
                            backgroundColor: Colors.orange,
                            elevation: 4,
                            label: Text("Wifi"),
                            onSelected: (bool sel) {
                              sel = true;
                            }),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("AC"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Beach View"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Breakfast"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Pool"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Spa"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Tea"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Coffe"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Drinks"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Alcohol"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(2),
                    child: FilterChip(
                        backgroundColor: Colors.orange,
                        elevation: 4,
                        label: Text("Bar"),
                        onSelected: (bool sel) {
                          sel = true;
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
