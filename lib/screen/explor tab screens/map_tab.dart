import 'package:flutter/material.dart';

class MapTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              size: 50,
            ),
            Text("No Data Available!"),
          ],
        ),
      ),
    );
  }
}
