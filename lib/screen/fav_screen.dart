import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(
              Icons.favorite,
              size: 100,
              color: Colors.pink,
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Your Favorite Destination Shows Here",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
          FittedBox(
              fit: BoxFit.fitWidth,
              child: Text("Right now you have no favorite destination."))
        ],
      ),
    );
  }
}
