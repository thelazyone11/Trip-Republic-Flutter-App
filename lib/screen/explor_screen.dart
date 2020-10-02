import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_helper/provider/model/destination_model.dart';
import 'package:tourist_helper/provider/places.dart';

import 'package:tourist_helper/screen/explor%20tab%20screens/attration_tab.dart';
import 'package:tourist_helper/screen/explor%20tab%20screens/food_tab.dart';
import 'package:tourist_helper/screen/explor%20tab%20screens/hotel_tab.dart';
import 'package:tourist_helper/screen/explor%20tab%20screens/map_tab.dart';
import 'package:tourist_helper/screen/explor%20tab%20screens/todo_tab.dart';

class ExplorScreen extends StatefulWidget {
  static const routeName = '/explor-screen';

  @override
  _ExplorScreenState createState() => _ExplorScreenState();
}

class _ExplorScreenState extends State<ExplorScreen> {
  @override
  Widget build(BuildContext context) {
    final placeTitle = ModalRoute.of(context).settings.arguments as String;
    final Destination place =
        Provider.of<Places>(context).getDestiByName(placeTitle);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(place.placeName),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              text: 'Attraction',
            ),
            Tab(
              text: 'Food',
            ),
            Tab(
              text: 'Map',
            ),
            Tab(
              text: 'Hotels',
            ),
            Tab(
              text: 'Things to do',
            )
          ]),
        ),
        body: TabBarView(children: [
          AttractionTab(place.nearby),
          FoobTab(),
          MapTab(),
          HotelTab(),
          TodoTab(),
        ]),
      ),
    );
  }
}
