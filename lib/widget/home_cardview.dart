import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tourist_helper/provider/model/destination_model.dart';
import 'package:tourist_helper/provider/places.dart';
import 'package:tourist_helper/screen/place_detail_screen.dart';
import 'package:tourist_helper/screen/see_all_screen.dart';

class HomeCardView extends StatefulWidget {
  final String categoryName;

  HomeCardView({this.categoryName});

  @override
  _HomeCardViewState createState() => _HomeCardViewState();
}

class _HomeCardViewState extends State<HomeCardView> {
  final bool gridmake = true;

  @override
  Widget build(BuildContext context) {
    List<Destination> _destination = Provider.of<Places>(context).getAllDesti();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoryName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(SeeAllScreen.routeName);
                  },
                  child: Text("See all"))
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 230,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(PlaceDetailScreen.routeName,
                        arguments: _destination[index].placeName);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Center(
                            child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: CachedNetworkImage(
                            imageUrl: _destination[index].placeImg[1],
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            height: 150,
                            width: 290,
                            fit: BoxFit.cover,
                          ),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child: Container(
                            width: 290,
                            color: Colors.black87,
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              _destination[index].placeName,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ));
            },
            itemCount: _destination.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
