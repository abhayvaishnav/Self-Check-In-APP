import 'package:HMApp/models/roomModel.dart';
import 'package:HMApp/screens/chips.dart';
import 'package:HMApp/screens/paymentScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'mainDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Room Search"),
        backgroundColor: Color.fromARGB(255, 54, 58, 70),
        elevation: 0,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Icon(Icons.filter_list_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chips(),
                ),
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        elevation: 10,
        child: MainDrawer(),
      ),
      body: SafeArea(child: RoomCardList()),
    );
  }
}

class RoomCardList extends StatefulWidget {
  @override
  _RoomCardListState createState() => _RoomCardListState();
}

class _RoomCardListState extends State<RoomCardList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          itemCount: roomList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(6),
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                    offset: Offset(2, 2), // shadow direction: bottom right
                  )
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        bottomLeft: Radius.circular(14)),
                    child: Image(
                      height: MediaQuery.of(context).size.width * 1.0,
                      width: MediaQuery.of(context).size.width * 0.4,
                      fit: BoxFit.cover,
                      image: AssetImage(roomList[index].imgUrl), //later
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: MediaQuery.of(context).size.width * 1,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(14),
                          bottomRight: Radius.circular(14)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          roomList[index].name,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        Text(
                          roomList[index].description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.ac_unit),
                            SizedBox(width: 10),
                            //
                            Icon(Icons.pool),
                            SizedBox(width: 10),
                            //
                            Icon(Icons.beach_access),
                            SizedBox(width: 10),
                            //
                            Icon(Icons.wifi),
                            SizedBox(width: 10),
                            //
                            Icon(Icons.fastfood_outlined),
                            SizedBox(width: 10),
                            //
                            Icon(Icons.spa_outlined),
                            SizedBox(width: 10),
                          ],
                        ),
                        RatingBar.builder(
                          onRatingUpdate: (value) {},
                          initialRating: roomList[index].rating,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // later
                                  roomList[index].price,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[900]),
                                ),
                                Text(
                                  "per night",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PaymentPage()));
                                },
                                child: Row(
                                  children: [
                                    Text("Book Now"),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
