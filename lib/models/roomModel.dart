class Room {
  int roomID;
  String name;
  String description;
  String imgUrl;
  bool ac;
  bool wifi;
  bool food;
  bool spa;
  bool pool;
  bool beach;
  double rating;
  String price;

  Room({
    this.roomID,
    this.imgUrl,
    this.name,
    this.description,
    this.ac,
    this.beach,
    this.food,
    this.pool,
    this.wifi,
    this.spa,
    this.rating,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'roomID': roomID,
      'name': name,
      'description': description,
      'imgUrl': imgUrl,
      'ac': ac,
      'wifi': wifi,
      'food': food,
      'spa': spa,
      'pool': pool,
      'beach': beach,
      'rating': rating,
      'price': price,
    };
  }
}

List roomList = [
  room01,
  room02,
  room03,
  room04,
  room05,
  room06,
  room07,
  room08,
  room09,
  room10,
];

Room room01 = Room(
  roomID: 1,
  imgUrl: "assets/image/hotelRooms/hotelRoom01.jpg",
  name: "Park Avenue",
  description:
      "Room Equipped with a king sized bed and a beautiful beach view for your perfect vacation",
  ac: true,
  pool: true,
  beach: false,
  wifi: true,
  food: true,
  spa: false,
  rating: 4.0,
  price: "\$ 69",
);

Room room02 = Room(
  roomID: 2,
  imgUrl: "assets/image/hotelRooms/hotelRoom02.jpg",
  name: "Paradise",
  description:
      "Room Equipped with a king sized bed and a beautiful beach view for your perfect vacation",
  ac: false,
  pool: true,
  beach: true,
  wifi: false,
  food: true,
  spa: true,
  rating: 3.8,
  price: "\$ 69",
);
Room room03 = Room(
  roomID: 3,
  imgUrl: "assets/image/hotelRooms/hotelRoom03.jpg",
  name: "Malibu",
  description:
      "Room Equipped with a king sized bed and a beautiful beach view for your perfect vacation",
  ac: false,
  pool: true,
  beach: true,
  wifi: false,
  food: true,
  spa: true,
  rating: 4.9,
  price: "\$ 129",
);
Room room04 = Room(
  roomID: 4,
  imgUrl: "assets/image/hotelRooms/hotelRoom04.jpg",
  name: "Miami",
  description:
      "Room Equipped with a king sized bed and a beautiful beach view for your perfect vacation",
  ac: false,
  pool: true,
  beach: true,
  wifi: false,
  food: true,
  spa: true,
  rating: 4.2,
  price: "\$ 49",
);
Room room05 = Room(
  roomID: 5,
  imgUrl: "assets/image/hotelRooms/hotelRoom05.jpg",
  name: "Tokyo",
  description:
      "Room Equipped with a king sized bed and a beautiful beach view for your perfect vacation",
  ac: false,
  pool: true,
  beach: true,
  wifi: false,
  food: true,
  spa: true,
  rating: 4.8,
  price: "\$ 79",
);
Room room06 = Room(
  roomID: 6,
  imgUrl: "assets/image/hotelRooms/hotelRoom06.jpg",
  name: "Maldievs",
  description:
      "Room Equipped with a king sized bed and a beautiful beach view for your perfect vacation",
  ac: false,
  pool: true,
  beach: true,
  wifi: false,
  food: true,
  spa: true,
  rating: 4.3,
  price: "\$ 69",
);
Room room07 = Room(
  roomID: 7,
  imgUrl: "assets/image/hotelRooms/hotelRoom07.jpg",
  name: "Paris",
  description:
      "Room Equipped with a king sized bed and a beautiful beach view for your perfect vacation",
  ac: false,
  pool: true,
  beach: true,
  wifi: false,
  food: true,
  spa: true,
  rating: 4.1,
  price: "\$ 69",
);
Room room08 = Room(
  roomID: 8,
  imgUrl: "assets/image/hotelRooms/hotelRoom08.jpg",
  name: "New York",
  description:
      "Room Equipped with a king sized bed and a beautiful beach view for your perfect vacation",
  ac: false,
  pool: true,
  beach: true,
  wifi: false,
  food: true,
  spa: true,
  rating: 4.7,
  price: "\$ 89",
);
Room room09 = Room(
  roomID: 9,
  imgUrl: "assets/image/hotelRooms/hotelRoom09.jpg",
  name: "Los Angeles",
  description:
      "Room Equipped with a king sized bed and a beautiful beach view for your perfect vacation",
  ac: false,
  pool: true,
  beach: true,
  wifi: false,
  food: true,
  spa: true,
  rating: 4.9,
  price: "\$ 99",
);
Room room10 = Room(
  roomID: 10,
  imgUrl: "assets/image/hotelRooms/hotelRoom10.jpg",
  name: "Singapore",
  description:
      "Room Equipped with a king sized bed and a beautiful beach view for your perfect vacation",
  ac: false,
  pool: true,
  beach: true,
  wifi: false,
  food: true,
  spa: true,
  rating: 4.0,
  price: "\$ 49",
);
