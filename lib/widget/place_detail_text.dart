import 'package:flutter/material.dart';
import 'package:tourist_helper/widget/text_deseption.dart';

class PlaceDetailText extends StatelessWidget {
  final String name;
  final String address;
  final String detail;

  PlaceDetailText({this.address, this.detail, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            address,
            style: TextStyle(color: Colors.grey[500]),
          ),
          SizedBox(
            height: 20,
          ),
          DescriptionTextWidget(
            text: detail,
          ),
        ],
      ),
    );
  }
}
