import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final String placeName;
  final String lat;
  final String lng;

  MapView({this.placeName, this.lat, this.lng});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: {
          Marker(
            position:
                LatLng(double.parse(widget.lat), double.parse(widget.lng)),
            markerId: MarkerId("destination"),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: widget.placeName),
          )
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(double.parse(widget.lat), double.parse(widget.lng)),
          zoom: 11.0,
        ),
      ),
    );
  }
}
