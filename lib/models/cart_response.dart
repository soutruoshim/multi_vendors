// To parse this JSON data, do
//
//     final cartResponse = cartResponseFromJson(jsonString);

import 'dart:convert';

List<CartResponse> cartResponseFromJson(String str) => List<CartResponse>.from(json.decode(str).map((x) => CartResponse.fromJson(x)));

String cartResponseToJson(List<CartResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartResponse {
  String id;
  String userId;
  ProductId productId;
  List<dynamic> additives;
  String instructions;
  double totalPrice;
  int quantity;

  CartResponse({
    required this.id,
    required this.userId,
    required this.productId,
    required this.additives,
    required this.instructions,
    required this.totalPrice,
    required this.quantity,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
    id: json["_id"],
    userId: json["userId"],
    productId: ProductId.fromJson(json["productId"]),
    additives: List<dynamic>.from(json["additives"].map((x) => x)),
    instructions: json["instructions"],
    totalPrice: json["totalPrice"]?.toDouble(),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "productId": productId.toJson(),
    "additives": List<dynamic>.from(additives.map((x) => x)),
    "instructions": instructions,
    "totalPrice": totalPrice,
    "quantity": quantity
  };
}

class ProductId {
  String id;
  String title;
  Restaurant restaurant;
  double rating;
  String ratingCount;
  List<String> imageUrl;

  ProductId({
    required this.id,
    required this.title,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.imageUrl,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
    id: json["_id"],
    title: json["title"],
    restaurant: Restaurant.fromJson(json["restaurant"]),
    rating: json["rating"]?.toDouble(),
    ratingCount: json["ratingCount"],
    imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "restaurant": restaurant.toJson(),
    "rating": rating,
    "ratingCount": ratingCount,
    "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
  };
}

class Restaurant {
  Coords coords;
  String id;
  String time;
  String imageUrl;

  Restaurant({
    required this.coords,
    required this.id,
    required this.time,
    required this.imageUrl,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    coords: Coords.fromJson(json["coords"]),
    id: json["_id"],
    time: json["time"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "coords": coords.toJson(),
    "_id": id,
    "time": time,
    "imageUrl": imageUrl,
  };
}

class Coords {
  String id;
  double latitude;
  double longitude;
  String address;
  String title;
  double latitudeDelta;
  double longitudeDelta;

  Coords({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.title,
    required this.latitudeDelta,
    required this.longitudeDelta,
  });

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
    id: json["id"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    address: json["address"],
    title: json["title"],
    latitudeDelta: json["latitudeDelta"]?.toDouble(),
    longitudeDelta: json["longitudeDelta"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "title": title,
    "latitudeDelta": latitudeDelta,
    "longitudeDelta": longitudeDelta,
  };
}
