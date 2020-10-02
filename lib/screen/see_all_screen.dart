import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_helper/provider/model/destination_model.dart';
import 'package:tourist_helper/provider/places.dart';
import 'package:tourist_helper/screen/place_detail_screen.dart';

class SeeAllScreen extends StatelessWidget {
  static const routeName = '/seeall-screen';
  @override
  Widget build(BuildContext context) {
    List<Destination> desti = Provider.of<Places>(context).getAllDesti();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Text(
                'All Destination',
                style: TextStyle(fontSize: 34),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              itemCount: desti.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                      PlaceDetailScreen.routeName,
                      arguments: desti[index].placeName),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(desti[index].placeImg[2]),
                      ),
                      title: Text(desti[index].placeName),
                      subtitle: Text(desti[index].address),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
