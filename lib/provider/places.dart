import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:tourist_helper/provider/model/destination_model.dart';

List<Destination> _destination;

class Places with ChangeNotifier {
  static const url = 'DATABASE_API_URL_HERE';
  Future<List<Destination>> getData() async {
    if (_destination == null) {
      final respons = await http.get(url);
      final List<Destination> destinationData =
          destinationFromJson(respons.body);
      //print(destinationData);
      _destination = destinationData;
      return destinationData;
    }

    return _destination;
  }

  getAllDesti() {
    return _destination;
  }

  getImg() {
    List<String> img = [];
    _destination.forEach((element) {
      img.addAll(element.placeImg);
    });
    return img;
  }

  getName() {
    String name;

    _destination.forEach((element) {
      name = element.placeName;
    });
    return name;
  }

  getDestiByName(String place) {
    var index =
        _destination.indexWhere((element) => element.placeName == place);
    return _destination[index];
  }

  search(String value) {
    List<Destination> searchedList = [];
    searchedList.addAll(_destination.where((element) =>
        element.placeName.toLowerCase().contains(value.toLowerCase())));
    print("Search");
    return searchedList;
  }
}
