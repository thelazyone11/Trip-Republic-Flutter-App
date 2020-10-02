import 'hotel_model.dart';
import 'nearby_model.dart';
import 'dart:convert';

List<Destination> destinationFromJson(String str) => List<Destination>.from(
    json.decode(str).map((x) => Destination.fromJson(x)));

String destinationToJson(List<Destination> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Destination {
  Destination(
      {this.address,
      this.hotels,
      this.isFav,
      this.nearby,
      this.placeDetails,
      this.placeImg,
      this.placeLat,
      this.placeLng,
      this.placeName,
      this.state,
      this.food});

  String address;
  List<Hotel> hotels;
  bool isFav;
  List<Nearby> nearby;
  String placeDetails;
  List<String> placeImg;
  String placeLat;
  String placeLng;
  String placeName;
  String state;
  List<Food> food;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        address: json["address"],
        hotels: json["hotels"] == null
            ? null
            : List<Hotel>.from(json["hotels"].map((x) => Hotel.fromJson(x))),
        food: json["food"] == null
            ? null
            : List<Food>.from(json["food"].map((x) => Food.fromJson(x))),
        isFav: json["isFav"],
        nearby: json["nearby"] == null
            ? null
            : List<Nearby>.from(json["nearby"].map((x) => Nearby.fromJson(x))),
        placeDetails: json["placeDetails"],
        placeImg: List<String>.from(json["placeImg"].map((x) => x)),
        placeLat: json["placeLat"],
        placeLng: json["placeLng"],
        placeName: json["placeName"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "hotels": hotels == null
            ? null
            : List<dynamic>.from(hotels.map((x) => x.toJson())),
        "food": food == null
            ? null
            : List<dynamic>.from(hotels.map((x) => x.toJson())),
        "isFav": isFav,
        "nearby": nearby == null
            ? null
            : List<dynamic>.from(nearby.map((x) => x.toJson())),
        "placeDetails": placeDetails,
        "placeImg": List<dynamic>.from(placeImg.map((x) => x)),
        "placeLat": placeLat,
        "placeLng": placeLng,
        "placeName": placeName,
        "state": state,
      };
}

class Food {
  final String foodImg;
  final String foodName;
  final String foodDetail;

  Food({this.foodDetail, this.foodImg, this.foodName});

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        foodName: json["foodName"],
        foodDetail: json["foodDetail"],
        foodImg: json["foodImg"],
      );

  Map<String, dynamic> toJson() => {
        "foodName": foodName,
        "foodDetail": foodDetail,
        "foodImg": foodImg,
      };
}
