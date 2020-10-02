import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_helper/provider/model/destination_model.dart';
import 'package:tourist_helper/provider/places.dart';
import 'package:tourist_helper/widget/explor_widget.dart';
import 'package:tourist_helper/widget/hotel_widget.dart';
import 'package:tourist_helper/widget/map_widget.dart';
import 'package:tourist_helper/widget/place_detail_text.dart';
import 'package:tourist_helper/widget/place_detail_top.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/placedetail-screen';
  @override
  Widget build(BuildContext context) {
    final placeName = ModalRoute.of(context).settings.arguments as String;
    Destination desti = Provider.of<Places>(context).getDestiByName(placeName);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                PlaceDetailTop(desti.placeImg),
                PlaceDetailText(
                  address: desti.address,
                  name: desti.placeName,
                  detail: desti.placeDetails,
                ),
                HotelWidget(desti.hotels),
                BookSuggestWidget(),
                MapWidget(
                  placeName: desti.placeName,
                  lat: desti.placeLat,
                  lng: desti.placeLng,
                ),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
          StartExplreWidget(desti.placeName)
        ],
      ),
    );
  }
}

class BookSuggestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 80,
        child: ListTile(
          title: Text("Ready For Takeoff"),
          isThreeLine: true,
          subtitle: Text(
            "Get your air ticket,train ticket and pre-book self drive car.",
          ),
          trailing: RaisedButton(
              color: Colors.lightBlue, onPressed: () {}, child: Text("Book")),
        ),
      ),
    );
  }
}
