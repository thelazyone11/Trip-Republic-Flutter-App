import 'package:flutter/material.dart';
import 'package:tourist_helper/screen/explor_screen.dart';

class StartExplreWidget extends StatelessWidget {
  final String placeTitle;
  StartExplreWidget(this.placeTitle);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(ExplorScreen.routeName, arguments: placeTitle),
          child: Container(
              height: 70,
              color: Colors.lightGreen,
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(child: Text("Start Exploring")))),
        ),
      ),
    );
  }
}
