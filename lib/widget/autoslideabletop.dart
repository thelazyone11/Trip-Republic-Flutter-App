import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:tourist_helper/provider/model/destination_model.dart';
import 'package:tourist_helper/provider/places.dart';

class HomeTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Destination> desti = Provider.of<Places>(context).getAllDesti();

    return CarouselSlider(
      items: desti
          .map((e) => Container(
                child: Center(
                    child: CachedNetworkImage(
                  imageUrl: e.placeImg[0],
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 400,
                  fit: BoxFit.cover,
                )),
              ))
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        height: 400,
        viewportFraction: 1.0,
      ),
    );
  }
}

// Image.network(
//                   e.placeImg[3],
//                   fit: BoxFit.cover,
//                   height: 400,
//                 )
