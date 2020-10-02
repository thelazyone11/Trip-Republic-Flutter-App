import 'package:flutter/material.dart';
import 'package:tourist_helper/provider/model/hotel_model.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HotelWidget extends StatelessWidget {
  final List<Hotel> hotel;
  HotelWidget(this.hotel);

  @override
  Widget build(BuildContext context) {
    return hotel == null
        ? SizedBox()
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hotels",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    InkWell(onTap: () {}, child: Text("See all"))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 130,
                  child: ListView.builder(
                    itemCount: hotel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 10, top: 10, bottom: 10),
                        child: Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                hotel[index].hotelImg,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 150,
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
  }
}
