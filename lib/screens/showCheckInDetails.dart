import 'package:HMApp/database/databaseHelper.dart';
import 'package:HMApp/models/userDetails.dart';
import 'package:flutter/material.dart';

import 'mainDrawer.dart';

class ShowCheckInDetails extends StatefulWidget {
  @override
  _ShowCheckInDetailsState createState() => _ShowCheckInDetailsState();
}

class _ShowCheckInDetailsState extends State<ShowCheckInDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Check In Details"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 54, 58, 70),
        ),
        drawer: Drawer(child: MainDrawer()),
        body: FutureBuilder<List<Todo>>(
          future: DatabaseHelper.instance.retrieveTodos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].title),
                    leading: Text(snapshot.data[index].id.toString()),
                    subtitle: Text(snapshot.data[index].content),
                    // onTap: () => _navigateToDetail(context, snapshot.data[index]),
                    trailing: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          _deleteTodo(snapshot.data[index]);
                          setState(() {});
                        }),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Oops!");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

_deleteTodo(Todo todo) {
  DatabaseHelper.instance.deleteTodo(todo.id);
}

// _navigateToDetail(BuildContext context, Todo todo) async {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => DetailTodoScreen(todo: todo)),
//   );
// }
