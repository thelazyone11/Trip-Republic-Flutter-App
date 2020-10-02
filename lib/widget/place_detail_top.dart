import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:carousel_slider/carousel_options.dart';

class PlaceDetailTop extends StatefulWidget {
  final List<String> imgList;
  PlaceDetailTop(this.imgList);
  @override
  _PlaceDetailTopState createState() => _PlaceDetailTopState();
}

class _PlaceDetailTopState extends State<PlaceDetailTop> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imgList.map((url) {
              int index = widget.imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
      SizedBox(
        width: 10,
      ),
      CarouselSlider(
        items: widget.imgList
            .map((e) => Container(
                  child: Center(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CachedNetworkImage(
                      imageUrl: e,
                      fit: BoxFit.cover,
                      height: 300,
                      width: 350,
                    ),
                  )),
                ))
            .toList(),
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            //aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
    ]);
  }
}
