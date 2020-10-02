import 'package:flutter/material.dart';
import 'package:tourist_helper/maps/map%20screen/map_view.dart';

class MapWidget extends StatelessWidget {
  final String lat;
  final String lng;
  final String placeName;
  MapWidget({this.lat, this.lng, this.placeName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            "Locate Place On Map",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width - 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: MapView(
              placeName: placeName,
              lat: lat,
              lng: lng,
            ),
          ),
        ),
      ],
    );
  }
}
